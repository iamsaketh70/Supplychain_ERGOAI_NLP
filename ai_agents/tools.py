"""LangChain tools exposed to each warehouse AI agent."""

from __future__ import annotations

from typing import Annotated

from langchain_core.tools import tool

from ai_agents.knowledge import WarehouseKnowledge

_KB: WarehouseKnowledge | None = None


def bind_knowledge(kb: WarehouseKnowledge) -> None:
    global _KB
    _KB = kb


def _require_kb() -> WarehouseKnowledge:
    if _KB is None:
        raise RuntimeError("Warehouse knowledge not loaded. Call bind_knowledge() first.")
    return _KB


@tool
def list_orders() -> str:
    """List all warehouse orders with line counts and zone spread."""
    kb = _require_kb()
    lines = ["Orders:"]
    for (order_id,) in kb.get("order"):
        zone_count = kb.order_zone_count(order_id)
        items = kb.order_lines(order_id)
        lines.append(
            f"  {order_id}: {len(items)} lines, {zone_count} zones, "
            f"products={[p for p, _ in items]}"
        )
    return "\n".join(lines)


@tool
def score_order_priority(order_id: Annotated[str, "Order id like order_1001"]) -> str:
    """Score an order for fulfillment priority (higher = fulfill first)."""
    kb = _require_kb()
    zones = kb.order_zone_count(order_id)
    lines = kb.order_lines(order_id)
    fragile_count = sum(
        1 for product, _ in lines if "fragile" in kb.product_properties(product)
    )
    frozen_count = sum(
        1 for product, _ in lines if "frozen" in kb.product_properties(product)
    )
    score = 100 - (zones * 8) + (fragile_count * 3) + (frozen_count * 5) + len(lines)
    return (
        f"order={order_id} priority_score={score} zones={zones} "
        f"lines={len(lines)} fragile={fragile_count} frozen={frozen_count}"
    )


@tool
def list_safety_alerts() -> str:
    """Return all safety violations detected in the warehouse."""
    kb = _require_kb()
    alerts = kb.safety_alerts()
    if not alerts:
        return "No safety alerts."
    lines = ["Safety alerts:"]
    for alert in alerts:
        lines.append(f"  [{alert['severity']}] {alert['type']}: {alert}")
    return "\n".join(lines)


@tool
def list_ml_move_recommendations(limit: Annotated[int, "Max recommendations"] = 10) -> str:
    """Return ML-driven shelf move recommendations from co-purchase patterns."""
    kb = _require_kb()
    moves = kb.ml_move_recommendations()[:limit]
    if not moves:
        return "No move recommendations."
    lines = ["ML move recommendations:"]
    for move in moves:
        lines.append(
            f"  {move['item']}: {move['from_zone']} -> {move['to_zone']} "
            f"(score={move['score']}, partner_gain={move['partner_gain']})"
        )
    return "\n".join(lines)


@tool
def list_colocation_alerts(limit: Annotated[int, "Max alerts"] = 10) -> str:
    """Return co-purchased items stored in different zones."""
    kb = _require_kb()
    alerts = kb.ml_colocation_alerts()[:limit]
    if not alerts:
        return "No colocation alerts."
    lines = ["Colocation alerts:"]
    for alert in alerts:
        lines.append(
            f"  {alert['item1']}({alert['zone1']}) <-> "
            f"{alert['item2']}({alert['zone2']})"
        )
    return "\n".join(lines)


@tool
def get_frequently_bought_together(
    item: Annotated[str, "Product atom name"],
) -> str:
    """Get ML co-purchase partners for a product."""
    kb = _require_kb()
    partners = kb.partners(item)
    zone = kb.item_in_zone(item)
    return f"item={item} zone={zone} partners={partners}"


@tool
def list_robot_status() -> str:
    """Return robot positions and carried shelves."""
    kb = _require_kb()
    lines = ["Robots:"]
    for (robot,) in kb.get("robot"):
        pos = next(
            (f"({x},{y})" for r, x, y in kb.get("robot_position") if r == robot),
            "unknown",
        )
        carries = next(
            (c for r, c in kb.get("robot_carries") if r == robot),
            "none",
        )
        lines.append(f"  {robot} at {pos} carrying {carries}")
    return "\n".join(lines)


@tool
def suggest_robot_for_order(
    order_id: Annotated[str, "Order id like order_1001"],
) -> str:
    """Suggest which robot should pick an order based on highway proximity."""
    kb = _require_kb()
    robots = [r for (r,) in kb.get("robot")]
    if not robots:
        return "No robots available."
    # Prefer robot closest to picking station (1,1) or (1,6)
    best_robot = robots[0]
    best_dist = 999
    for robot in robots:
        pos = next(
            ((int(x), int(y)) for r, x, y in kb.get("robot_position") if r == robot),
            None,
        )
        if not pos:
            continue
        dist = min(abs(pos[0] - 1) + abs(pos[1] - 1), abs(pos[0] - 1) + abs(pos[1] - 6))
        if dist < best_dist:
            best_dist = dist
            best_robot = robot
    return f"order={order_id} assigned_robot={best_robot} highway_distance={best_dist}"


@tool
def warehouse_summary() -> str:
    """High-level warehouse stats for orchestration."""
    kb = _require_kb()
    summary = kb.summary()
    return "Warehouse summary: " + ", ".join(f"{k}={v}" for k, v in summary.items())


ALL_TOOLS = [
    list_orders,
    score_order_priority,
    list_safety_alerts,
    list_ml_move_recommendations,
    list_colocation_alerts,
    get_frequently_bought_together,
    list_robot_status,
    suggest_robot_for_order,
    warehouse_summary,
]

ORDER_TOOLS = [list_orders, score_order_priority, warehouse_summary]
SAFETY_TOOLS = [list_safety_alerts, warehouse_summary]
ML_TOOLS = [
    list_ml_move_recommendations,
    list_colocation_alerts,
    get_frequently_bought_together,
    warehouse_summary,
]
ROBOT_TOOLS = [list_robot_status, suggest_robot_for_order, list_orders, warehouse_summary]
