"""Specialist agent nodes — rule-based scoring + optional LLM enhancement."""

from __future__ import annotations

import json
import os
from typing import Any

from ai_agents.knowledge import WarehouseKnowledge


def _severity_weight(severity: str) -> int:
    return {"critical": 100, "high": 80, "medium": 50, "low": 20}.get(severity, 10)


def order_priority_agent(kb: WarehouseKnowledge, use_llm: bool = False) -> dict[str, Any]:
    """Shortlist orders to fulfill first."""
    scored: list[dict[str, Any]] = []
    for (order_id,) in kb.get("order"):
        zones = kb.order_zone_count(order_id)
        lines = kb.order_lines(order_id)
        fragile = sum(
            1 for p, _ in lines if "fragile" in kb.product_properties(p)
        )
        frozen = sum(1 for p, _ in lines if "frozen" in kb.product_properties(p))
        score = 100 - (zones * 8) + (fragile * 3) + (frozen * 5) + len(lines)
        scored.append(
            {
                "order_id": order_id,
                "score": score,
                "zones": zones,
                "line_count": len(lines),
                "reason": f"{zones} zones, {len(lines)} lines, fragile={fragile}, frozen={frozen}",
            }
        )

    scored.sort(key=lambda x: x["score"], reverse=True)
    shortlist = scored[:5]

    llm_note = ""
    if use_llm and os.getenv("OPENAI_API_KEY"):
        llm_note = _llm_enrich(
            "Order Priority Agent",
            shortlist,
            "Rank these orders for warehouse fulfillment priority.",
        )

    return {
        "agent": "order_priority",
        "shortlist": shortlist,
        "llm_enrichment": llm_note,
    }


def safety_compliance_agent(
    kb: WarehouseKnowledge, use_llm: bool = False
) -> dict[str, Any]:
    """Shortlist safety fixes by severity."""
    alerts = kb.safety_alerts()
    scored = []
    for alert in alerts:
        scored.append(
            {
                **alert,
                "score": _severity_weight(alert["severity"]),
                "action": _safety_action(alert),
            }
        )
    scored.sort(key=lambda x: x["score"], reverse=True)
    shortlist = scored[:8]

    llm_note = ""
    if use_llm and os.getenv("OPENAI_API_KEY"):
        llm_note = _llm_enrich(
            "Safety Compliance Agent",
            shortlist,
            "Prioritize these safety interventions for a warehouse.",
        )

    return {
        "agent": "safety_compliance",
        "shortlist": shortlist,
        "llm_enrichment": llm_note,
    }


def _safety_action(alert: dict) -> str:
    mapping = {
        "hazmat_reaction": "Separate oxidizer and flammable items immediately",
        "spoilage_risk": "Move frozen item to zone_C freezer",
        "heavy_fall_risk": "Relocate heavy item to lower shelf level",
        "fragile_risk": "Lower fragile item to shelf level <= 5",
        "humidity_damage": "Move paper goods out of high-humidity zone_B",
        "electronic_in_freezer": "Move electronic item out of freezer zone",
    }
    return mapping.get(alert["type"], "Inspect and remediate")


def ml_layout_agent(kb: WarehouseKnowledge, use_llm: bool = False) -> dict[str, Any]:
    """Shortlist ML-driven layout optimizations."""
    moves = kb.ml_move_recommendations()
    colocation = kb.ml_colocation_alerts()

    shortlist = []
    for move in moves[:6]:
        shortlist.append(
            {
                "type": "shelf_move",
                "item": move["item"],
                "from_zone": move["from_zone"],
                "to_zone": move["to_zone"],
                "score": move["score"],
                "reason": f"Co-purchase partner gain +{move['partner_gain']}",
            }
        )

    for alert in colocation[:4]:
        shortlist.append(
            {
                "type": "colocation_alert",
                "item1": alert["item1"],
                "zone1": alert["zone1"],
                "item2": alert["item2"],
                "zone2": alert["zone2"],
                "score": 70,
                "reason": "Frequently bought together but in different zones",
            }
        )

    shortlist.sort(key=lambda x: x["score"], reverse=True)

    llm_note = ""
    if use_llm and os.getenv("OPENAI_API_KEY"):
        llm_note = _llm_enrich(
            "ML Layout Agent",
            shortlist,
            "Recommend top warehouse layout changes from co-purchase ML facts.",
        )

    return {
        "agent": "ml_layout",
        "shortlist": shortlist,
        "llm_enrichment": llm_note,
    }


def inventory_agent(kb: WarehouseKnowledge, use_llm: bool = False) -> dict[str, Any]:
    """Shortlist misplaced or high-risk inventory items."""
    shortlist: list[dict[str, Any]] = []

    for shelf, product, qty in kb.get("shelf_stock"):
        if int(qty) <= 0:
            continue
        zone = kb.item_in_zone(product)
        partners = kb.partners(product)
        partner_zones = {kb.item_in_zone(p) for p in partners if kb.item_in_zone(p)}
        if zone and partner_zones and zone not in partner_zones:
            shortlist.append(
                {
                    "item": product,
                    "shelf": shelf,
                    "zone": zone,
                    "score": 60 + len(partners),
                    "reason": "Misaligned with co-purchase partner zones",
                }
            )

    shortlist.sort(key=lambda x: x["score"], reverse=True)
    shortlist = shortlist[:8]

    llm_note = ""
    if use_llm and os.getenv("OPENAI_API_KEY"):
        llm_note = _llm_enrich(
            "Inventory Agent",
            shortlist,
            "Identify inventory relocation priorities.",
        )

    return {
        "agent": "inventory",
        "shortlist": shortlist,
        "llm_enrichment": llm_note,
    }


def robot_dispatcher_agent(
    kb: WarehouseKnowledge, order_shortlist: list[dict], use_llm: bool = False
) -> dict[str, Any]:
    """Assign robots to top-priority orders."""
    robots = [r for (r,) in kb.get("robot")]
    assignments: list[dict[str, Any]] = []

    for entry in order_shortlist[:3]:
        order_id = entry["order_id"]
        best_robot = robots[0] if robots else "robot1"
        best_dist = 999
        for robot in robots:
            pos = next(
                (
                    (int(x), int(y))
                    for r, x, y in kb.get("robot_position")
                    if r == robot
                ),
                None,
            )
            if not pos:
                continue
            dist = min(
                abs(pos[0] - 1) + abs(pos[1] - 1),
                abs(pos[0] - 1) + abs(pos[1] - 6),
            )
            if dist < best_dist:
                best_dist = dist
                best_robot = robot

        assignments.append(
            {
                "order_id": order_id,
                "robot": best_robot,
                "score": entry["score"],
                "highway_distance": best_dist,
                "reason": f"Nearest robot to picking station for priority order",
            }
        )

    llm_note = ""
    if use_llm and os.getenv("OPENAI_API_KEY"):
        llm_note = _llm_enrich(
            "Robot Dispatcher Agent",
            assignments,
            "Validate robot-to-order assignments for a warehouse grid.",
        )

    return {
        "agent": "robot_dispatcher",
        "shortlist": assignments,
        "llm_enrichment": llm_note,
    }


def supervisor_agent(
    order: dict,
    safety: dict,
    ml: dict,
    inventory: dict,
    robot: dict,
    use_llm: bool = False,
) -> dict[str, Any]:
    """Merge all agent shortlists into a unified action plan."""
    combined_score = 0
    if order["shortlist"]:
        combined_score += order["shortlist"][0]["score"]
    if safety["shortlist"]:
        combined_score += safety["shortlist"][0]["score"]

    final = {
        "top_orders": order["shortlist"][:3],
        "critical_safety": [a for a in safety["shortlist"] if a.get("severity") == "critical"],
        "top_moves": [m for m in ml["shortlist"] if m["type"] == "shelf_move"][:3],
        "inventory_fixes": inventory["shortlist"][:3],
        "robot_plan": robot["shortlist"],
        "combined_priority_score": combined_score,
        "recommended_actions": _build_action_plan(order, safety, ml, inventory, robot),
    }

    llm_note = ""
    if use_llm and os.getenv("OPENAI_API_KEY"):
        llm_note = _llm_enrich(
            "Supervisor Agent",
            final["recommended_actions"],
            "Produce executive summary of warehouse shortlist actions.",
        )

    return {
        "agent": "supervisor",
        "final_shortlist": final,
        "llm_enrichment": llm_note,
    }


def _build_action_plan(
    order: dict, safety: dict, ml: dict, inventory: dict, robot: dict
) -> list[str]:
    actions: list[str] = []
    for alert in safety["shortlist"][:2]:
        actions.append(f"[SAFETY] {alert.get('action', alert['type'])}")
    for move in ml["shortlist"][:2]:
        if move["type"] == "shelf_move":
            actions.append(
                f"[ML] Move {move['item']} from {move['from_zone']} to {move['to_zone']}"
            )
    for entry in order["shortlist"][:2]:
        actions.append(f"[ORDER] Fulfill {entry['order_id']} (score={entry['score']})")
    for assign in robot["shortlist"][:2]:
        actions.append(
            f"[ROBOT] Assign {assign['robot']} to {assign['order_id']}"
        )
    for item in inventory["shortlist"][:1]:
        actions.append(
            f"[INVENTORY] Relocate {item['item']} on {item['shelf']} ({item['reason']})"
        )
    return actions


def _llm_enrich(agent_name: str, data: Any, instruction: str) -> str:
    """Optional LangChain LLM pass when OPENAI_API_KEY is set."""
    try:
        from langchain_openai import ChatOpenAI
        from langchain_core.messages import HumanMessage, SystemMessage

        llm = ChatOpenAI(model="gpt-4o-mini", temperature=0)
        payload = json.dumps(data, indent=2)[:6000]
        response = llm.invoke(
            [
                SystemMessage(
                    content=(
                        f"You are the {agent_name} in a smart warehouse multi-agent system. "
                        "Be concise. Return 2-3 bullet insights."
                    )
                ),
                HumanMessage(content=f"{instruction}\n\nData:\n{payload}"),
            ]
        )
        return response.content
    except Exception as exc:  # noqa: BLE001 — demo path should not crash pipeline
        return f"(LLM enrichment skipped: {exc})"
