"""
LangGraph orchestration with HuggingFace LLM-powered agents.

How it works:
  1. Each agent node calls LangChain tools to get warehouse data
  2. Sends that data + its system prompt to a HuggingFace LLM
  3. The LLM reasons and produces analysis/recommendations
  4. LangGraph routes results through the pipeline
  5. Supervisor agent merges everything into final action plan

The LLM can be:
  - A local HuggingFace model (Phi-3, Mistral, Llama, etc.)
  - OpenAI API (if OPENAI_API_KEY is set)
  - Structured fallback (if no LLM available — still runs)
"""

from __future__ import annotations

import operator
from typing import Annotated, Any, TypedDict

from langgraph.graph import END, START, StateGraph

from ai_agents.knowledge import WarehouseKnowledge
from ai_agents.tools import bind_knowledge, ALL_TOOLS
from ai_agents.tools_extended import EXTENDED_TOOLS
from ai_agents.llm_agents import run_llm_agent


class WarehouseAgentState(TypedDict):
    kb_loaded: bool
    model_id: str
    order_result: dict[str, Any]
    safety_result: dict[str, Any]
    ml_result: dict[str, Any]
    inventory_result: dict[str, Any]
    robot_result: dict[str, Any]
    demand_result: dict[str, Any]
    anomaly_result: dict[str, Any]
    energy_result: dict[str, Any]
    supervisor_result: dict[str, Any]
    trace: Annotated[list[str], operator.add]


_KB: WarehouseKnowledge | None = None


def _get_kb() -> WarehouseKnowledge:
    global _KB
    if _KB is None:
        _KB = WarehouseKnowledge.load()
        bind_knowledge(_KB)
    return _KB


def _invoke_tool(tool_fn, **kwargs) -> str:
    """Call a LangChain tool and return its string output."""
    try:
        return tool_fn.invoke(kwargs) if kwargs else tool_fn.invoke({})
    except Exception as e:
        return f"Tool error: {e}"


# ============================================================================
# Agent nodes — each calls tools, then sends data to HuggingFace LLM
# ============================================================================


def load_context(state: WarehouseAgentState) -> dict:
    kb = _get_kb()
    summary = kb.summary()
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    return {
        "kb_loaded": True,
        "trace": [
            f"[INIT] Loaded: {summary['orders']} orders, {summary['shelves']} shelves, "
            f"{summary['ml_pairs']} ML pairs, {summary['safety_alerts']} alerts | "
            f"LLM: {model_id}"
        ],
    }


def order_priority_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools import list_orders, score_order_priority, warehouse_summary

    tool_outputs = {
        "warehouse_summary": _invoke_tool(warehouse_summary),
        "list_orders": _invoke_tool(list_orders),
    }
    kb = _get_kb()
    for (order_id,) in kb.get("order"):
        tool_outputs[f"score_{order_id}"] = _invoke_tool(
            score_order_priority, order_id=order_id
        )

    result = run_llm_agent("order_priority", tool_outputs, model_id, use_llm=False)
    return {
        "order_result": result,
        "trace": [f"[AGENT] Order Priority ({result['mode']}): analyzed {len(kb.get('order'))} orders"],
    }


def safety_compliance_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools import list_safety_alerts, warehouse_summary

    tool_outputs = {
        "safety_alerts": _invoke_tool(list_safety_alerts),
        "warehouse_summary": _invoke_tool(warehouse_summary),
    }

    result = run_llm_agent("safety_compliance", tool_outputs, model_id, use_llm=False)
    alert_count = tool_outputs["safety_alerts"].count("[")
    return {
        "safety_result": result,
        "trace": [f"[AGENT] Safety Compliance ({result['mode']}): {alert_count} violations analyzed"],
    }


def ml_layout_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools import list_ml_move_recommendations, list_colocation_alerts

    tool_outputs = {
        "ml_moves": _invoke_tool(list_ml_move_recommendations, limit=10),
        "colocation_alerts": _invoke_tool(list_colocation_alerts, limit=10),
    }

    result = run_llm_agent("ml_layout", tool_outputs, model_id, use_llm=False)
    return {
        "ml_result": result,
        "trace": [f"[AGENT] ML Layout ({result['mode']}): co-purchase optimization analyzed"],
    }


def inventory_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools_extended import predict_demand, analyze_knowledge_graph

    kb = _get_kb()
    products = list({p for _, p, q in kb.get("shelf_stock") if int(q) > 0})[:5]

    tool_outputs = {}
    for product in products:
        tool_outputs[f"demand_{product}"] = _invoke_tool(predict_demand, product=product)
        tool_outputs[f"kg_{product}"] = _invoke_tool(analyze_knowledge_graph, product=product)

    result = run_llm_agent("inventory", tool_outputs, model_id, use_llm=False)
    return {
        "inventory_result": result,
        "trace": [f"[AGENT] Inventory ({result['mode']}): {len(products)} products analyzed"],
    }


def robot_dispatcher_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools import list_robot_status, suggest_robot_for_order
    from ai_agents.tools_extended import predict_maintenance

    kb = _get_kb()
    tool_outputs = {
        "robot_status": _invoke_tool(list_robot_status),
    }
    for (robot,) in kb.get("robot"):
        tool_outputs[f"maintenance_{robot}"] = _invoke_tool(predict_maintenance, robot=robot)
    for (order_id,) in kb.get("order"):
        tool_outputs[f"assign_{order_id}"] = _invoke_tool(
            suggest_robot_for_order, order_id=order_id
        )

    result = run_llm_agent("robot_dispatcher", tool_outputs, model_id, use_llm=False)
    return {
        "robot_result": result,
        "trace": [f"[AGENT] Robot Dispatcher ({result['mode']}): {len(kb.get('robot'))} robots dispatched"],
    }


def demand_forecasting_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools_extended import predict_demand

    kb = _get_kb()
    products = list({p for _, p, q in kb.get("shelf_stock") if int(q) > 0})[:8]

    tool_outputs = {}
    for product in products:
        tool_outputs[f"forecast_{product}"] = _invoke_tool(predict_demand, product=product)

    result = run_llm_agent("demand_forecasting", tool_outputs, model_id, use_llm=False)
    return {
        "demand_result": result,
        "trace": [f"[AGENT] Demand Forecasting ({result['mode']}): {len(products)} products forecasted"],
    }


def anomaly_detection_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools_extended import detect_anomalies, optimize_zone_energy
    from ai_agents.tools import list_safety_alerts

    kb = _get_kb()
    tool_outputs = {
        "anomaly_scan": _invoke_tool(detect_anomalies),
        "safety_alerts": _invoke_tool(list_safety_alerts),
    }
    for (zone,) in kb.get("zone"):
        tool_outputs[f"energy_{zone}"] = _invoke_tool(optimize_zone_energy, zone=zone)

    result = run_llm_agent("anomaly_detection", tool_outputs, model_id, use_llm=False)
    is_anomalous = "is_anomalous=True" in tool_outputs.get("anomaly_scan", "")
    return {
        "anomaly_result": {**result, "is_anomalous": is_anomalous},
        "trace": [f"[AGENT] Anomaly Detection ({result['mode']}): anomalous={is_anomalous}"],
    }


def energy_optimization_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    from ai_agents.tools_extended import optimize_zone_energy

    kb = _get_kb()
    tool_outputs = {}
    for (zone,) in kb.get("zone"):
        tool_outputs[f"energy_{zone}"] = _invoke_tool(optimize_zone_energy, zone=zone)

    result = run_llm_agent("energy_optimization", tool_outputs, model_id, use_llm=False)
    return {
        "energy_result": result,
        "trace": [f"[AGENT] Energy Optimization ({result['mode']}): {len(kb.get('zone'))} zones analyzed"],
    }


# ============================================================================
# Supervisor — merges all agent outputs
# ============================================================================


def should_escalate(state: WarehouseAgentState) -> str:
    anomaly = state.get("anomaly_result", {})
    if anomaly.get("is_anomalous", False):
        return "escalated_supervisor"
    return "standard_supervisor"


def _build_supervisor_input(state: WarehouseAgentState) -> dict[str, str]:
    """Collect all agent reasoning outputs for supervisor."""
    tool_outputs = {}
    for key in [
        "order_result", "safety_result", "ml_result", "inventory_result",
        "robot_result", "demand_result", "anomaly_result", "energy_result",
    ]:
        agent_data = state.get(key, {})
        reasoning = agent_data.get("reasoning", "No data")
        agent_name = agent_data.get("agent", key)
        tool_outputs[agent_name] = reasoning[:500]
    return tool_outputs


def standard_supervisor_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    tool_outputs = _build_supervisor_input(state)
    result = run_llm_agent("supervisor", tool_outputs, model_id, use_llm=True)
    result["escalation"] = False
    return {
        "supervisor_result": result,
        "trace": [f"[SUPERVISOR] Standard merge completed ({result['mode']})"],
    }


def escalated_supervisor_node(state: WarehouseAgentState) -> dict:
    model_id = state.get("model_id", "TinyLlama/TinyLlama-1.1B-Chat-v1.0")
    tool_outputs = _build_supervisor_input(state)
    tool_outputs["ESCALATION_WARNING"] = (
        "CRITICAL: Anomalous warehouse state detected. "
        "Prioritize safety and anomaly resolution above all else."
    )
    result = run_llm_agent("supervisor", tool_outputs, model_id, use_llm=True)
    result["escalation"] = True
    return {
        "supervisor_result": result,
        "trace": ["[SUPERVISOR] ESCALATED - anomaly/critical conditions detected"],
    }


# ============================================================================
# Graph construction
# ============================================================================


def build_shortlist_graph():
    """
    Build the LangGraph multi-agent workflow.
    
    Each node:
      1. Calls LangChain tools to get warehouse data
      2. Sends data to HuggingFace LLM for reasoning
      3. Returns structured result to state
    
    Conditional routing: anomaly -> escalated supervisor
    """
    graph = StateGraph(WarehouseAgentState)

    graph.add_node("load_context", load_context)
    graph.add_node("order_priority", order_priority_node)
    graph.add_node("safety_compliance", safety_compliance_node)
    graph.add_node("ml_layout", ml_layout_node)
    graph.add_node("inventory", inventory_node)
    graph.add_node("robot_dispatcher", robot_dispatcher_node)
    graph.add_node("demand_forecasting", demand_forecasting_node)
    graph.add_node("anomaly_detection", anomaly_detection_node)
    graph.add_node("energy_optimization", energy_optimization_node)
    graph.add_node("standard_supervisor", standard_supervisor_node)
    graph.add_node("escalated_supervisor", escalated_supervisor_node)

    graph.add_edge(START, "load_context")
    graph.add_edge("load_context", "order_priority")
    graph.add_edge("order_priority", "safety_compliance")
    graph.add_edge("safety_compliance", "ml_layout")
    graph.add_edge("ml_layout", "inventory")
    graph.add_edge("inventory", "robot_dispatcher")
    graph.add_edge("robot_dispatcher", "demand_forecasting")
    graph.add_edge("demand_forecasting", "anomaly_detection")
    graph.add_edge("anomaly_detection", "energy_optimization")

    graph.add_conditional_edges(
        "energy_optimization",
        should_escalate,
        {
            "standard_supervisor": "standard_supervisor",
            "escalated_supervisor": "escalated_supervisor",
        },
    )

    graph.add_edge("standard_supervisor", END)
    graph.add_edge("escalated_supervisor", END)

    return graph.compile()


def build_react_agent():
    """
    Build a ReAct agent that can use all 17 tools interactively.
    Requires either HuggingFace model or OPENAI_API_KEY.
    """
    from ai_agents.llm_agents import get_llm

    _get_kb()
    llm = get_llm()
    if llm is None:
        return None

    try:
        from langgraph.prebuilt import create_react_agent
        all_tools = ALL_TOOLS + EXTENDED_TOOLS
        return create_react_agent(llm, all_tools)
    except Exception:
        return None
