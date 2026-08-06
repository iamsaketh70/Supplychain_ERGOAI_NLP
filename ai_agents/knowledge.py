"""Parse Ergo warehouse facts into a queryable knowledge base."""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from pathlib import Path


FACT_PATTERN = re.compile(
    r"([a-zA-Z_][\w]*)\(([^)]*)\)\s*\.",
)


@dataclass
class WarehouseKnowledge:
    """In-memory mirror of warehouse_data + ML + derived safety/ML facts."""

    facts: dict[str, list[tuple[str, ...]]] = field(default_factory=dict)
    project_root: Path = field(default_factory=Path.cwd)

    @classmethod
    def load(cls, project_root: Path | None = None) -> "WarehouseKnowledge":
        root = project_root or Path(__file__).resolve().parent.parent
        kb = cls(project_root=root)
        for rel in (
            "warehouse_data.ergo",
            "ergo_facts_neural_network.txt",
            "ergo_facts_neural_network.ergo",
        ):
            path = root / rel
            if path.exists():
                kb.ingest_file(path)
        return kb

    def ingest_file(self, path: Path) -> None:
        text = path.read_text(encoding="utf-8", errors="ignore")
        for match in FACT_PATTERN.finditer(text):
            predicate = match.group(1)
            args = tuple(
                arg.strip()
                for arg in match.group(2).split(",")
                if arg.strip()
            )
            self.facts.setdefault(predicate, []).append(args)

    def get(self, predicate: str) -> list[tuple[str, ...]]:
        return self.facts.get(predicate, [])

    def item_in_zone(self, item: str) -> str | None:
        for shelf, product, qty in self.get("shelf_stock"):
            if product == item and int(qty) > 0:
                for s, zone in self.get("shelf_in_zone"):
                    if s == shelf:
                        return zone
        return None

    def item_on_shelf(self, item: str) -> str | None:
        for shelf, product, qty in self.get("shelf_stock"):
            if product == item and int(qty) > 0:
                return shelf
        return None

    def product_properties(self, item: str) -> set[str]:
        return {prop for prod, prop in self.get("product_property") if prod == item}

    def zone_type(self, zone: str) -> str | None:
        for z, ztype in self.get("zone_type"):
            if z == zone:
                return ztype
        return None

    def zone_humidity(self, zone: str) -> str | None:
        for z, humidity in self.get("zone_humidity"):
            if z == zone:
                return humidity
        return None

    def shelf_level(self, shelf: str) -> int | None:
        for s, level in self.get("shelf_level"):
            if s == shelf:
                return int(level)
        return None

    def shelf_position(self, shelf: str) -> tuple[int, int] | None:
        for s, x, y in self.get("shelf_position"):
            if s == shelf:
                return int(x), int(y)
        return None

    def partners(self, item: str) -> list[str]:
        if not hasattr(self, "_partner_cache"):
            self._partner_cache: dict[str, list[str]] = {}
            for a, b in self.get("frequently_bought_together"):
                self._partner_cache.setdefault(a, []).append(b)
                self._partner_cache.setdefault(b, []).append(a)
        return self._partner_cache.get(item, [])

    def partner_count_in_zone(self, item: str, zone: str) -> int:
        return sum(
            1
            for partner in self.partners(item)
            if self.item_in_zone(partner) == zone
        )

    def order_lines(self, order_id: str) -> list[tuple[str, int]]:
        return [
            (product, int(qty))
            for order, product, qty in self.get("order_line")
            if order == order_id
        ]

    def order_zone_count(self, order_id: str) -> int:
        zones = {
            self.item_in_zone(product)
            for product, _ in self.order_lines(order_id)
            if self.item_in_zone(product)
        }
        return len(zones)

    def safety_alerts(self) -> list[dict]:
        alerts: list[dict] = []

        for shelf in {s for s, _, _ in self.get("shelf_stock")}:
            items = [
                (product, int(qty))
                for s, product, qty in self.get("shelf_stock")
                if s == shelf and int(qty) > 0
            ]
            oxidizers = [
                p for p, _ in items if "oxidizer" in self.product_properties(p)
            ]
            flammables = [
                p for p, _ in items if "flammable" in self.product_properties(p)
            ]
            for ox in oxidizers:
                for fl in flammables:
                    if ox < fl:
                        alerts.append(
                            {
                                "type": "hazmat_reaction",
                                "severity": "critical",
                                "item1": ox,
                                "item2": fl,
                                "shelf": shelf,
                            }
                        )

        for shelf, product, qty in self.get("shelf_stock"):
            if int(qty) <= 0:
                continue
            zone = next(
                (z for s, z in self.get("shelf_in_zone") if s == shelf), None
            )
            props = self.product_properties(product)

            if "frozen" in props and self.zone_type(zone) != "freezer":
                alerts.append(
                    {
                        "type": "spoilage_risk",
                        "severity": "high",
                        "item": product,
                        "shelf": shelf,
                        "zone": zone,
                    }
                )

            level = self.shelf_level(shelf)
            if level is not None:
                if "heavy" in props and level > 5:
                    alerts.append(
                        {
                            "type": "heavy_fall_risk",
                            "severity": "high",
                            "item": product,
                            "shelf": shelf,
                            "level": level,
                        }
                    )
                if "fragile" in props and level > 5:
                    alerts.append(
                        {
                            "type": "fragile_risk",
                            "severity": "medium",
                            "item": product,
                            "shelf": shelf,
                            "level": level,
                        }
                    )

            if "paper_goods" in props and self.zone_humidity(zone) == "high":
                alerts.append(
                    {
                        "type": "humidity_damage",
                        "severity": "medium",
                        "item": product,
                        "shelf": shelf,
                        "zone": zone,
                    }
                )

            if "electronic" in props and self.zone_type(zone) == "freezer":
                alerts.append(
                    {
                        "type": "electronic_in_freezer",
                        "severity": "medium",
                        "item": product,
                        "shelf": shelf,
                        "zone": zone,
                    }
                )

        return alerts

    def ml_move_recommendations(self) -> list[dict]:
        moves: list[dict] = []
        seen: set[tuple[str, str, str]] = set()
        items = {product for _, product, _ in self.get("shelf_stock")}

        for item in items:
            current = self.item_in_zone(item)
            if not current:
                continue
            best_zone = current
            best_count = self.partner_count_in_zone(item, current)
            for (zone,) in self.get("zone"):
                if zone == current:
                    continue
                count = self.partner_count_in_zone(item, zone)
                if count > best_count:
                    best_count = count
                    best_zone = zone
            if best_zone != current:
                key = (item, current, best_zone)
                if key not in seen:
                    seen.add(key)
                    moves.append(
                        {
                            "item": item,
                            "from_zone": current,
                            "to_zone": best_zone,
                            "partner_gain": best_count
                            - self.partner_count_in_zone(item, current),
                            "score": min(
                                100,
                                50
                                + 10
                                * (
                                    best_count
                                    - self.partner_count_in_zone(item, current)
                                ),
                            ),
                        }
                    )
        moves.sort(key=lambda m: m["score"], reverse=True)
        return moves

    def ml_colocation_alerts(self) -> list[dict]:
        alerts: list[dict] = []
        for a, b in self.get("frequently_bought_together"):
            z1, z2 = self.item_in_zone(a), self.item_in_zone(b)
            if z1 and z2 and z1 != z2:
                alerts.append(
                    {"item1": a, "zone1": z1, "item2": b, "zone2": z2}
                )
        return alerts

    def summary(self) -> dict:
        return {
            "orders": len(self.get("order")),
            "robots": len(self.get("robot")),
            "shelves": len(self.get("shelf")),
            "ml_pairs": len(self.get("frequently_bought_together")),
            "safety_alerts": len(self.safety_alerts()),
            "move_recommendations": len(self.ml_move_recommendations()),
        }
