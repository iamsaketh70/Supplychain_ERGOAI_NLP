"""Main entry point for the HuggingFace LLM multi-agent pipeline."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any

from ai_agents.export_ergo import write_ergo_shortlist
from ai_agents.graph import build_shortlist_graph, build_react_agent


def run_shortlist_pipeline(
    model_id: str = "TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    export_ergo: bool = True,
    project_root: Path | None = None,
) -> dict[str, Any]:
    """
    Run the LangGraph multi-agent pipeline.

    Each agent:
      1. Calls LangChain tools to query warehouse data
      2. Sends tool outputs to a HuggingFace LLM (or OpenAI, or fallback)
      3. LLM reasons over the data and produces analysis

    Agents:
      1. Order Priority          5. Robot Dispatcher
      2. Safety Compliance       6. Demand Forecasting
      3. ML Layout               7. Anomaly Detection
      4. Inventory               8. Energy Optimization
      9. Supervisor (conditional routing)
    """
    root = project_root or Path(__file__).resolve().parent.parent
    graph = build_shortlist_graph()

    result = graph.invoke(
        {
            "kb_loaded": False,
            "model_id": model_id,
            "order_result": {},
            "safety_result": {},
            "ml_result": {},
            "inventory_result": {},
            "robot_result": {},
            "demand_result": {},
            "anomaly_result": {},
            "energy_result": {},
            "supervisor_result": {},
            "trace": [],
        }
    )

    output = {
        "pipeline": "langgraph_huggingface_multi_agent",
        "llm_model": model_id,
        "framework": {
            "llm": f"HuggingFace ({model_id})",
            "orchestration": "LangGraph (StateGraph + conditional routing)",
            "tools": "LangChain (17 tools)",
            "deep_learning": "PyTorch (LSTM, VAE, DQN, Transformer, Embeddings)",
            "logic_engine": "ErgoAI (Prolog-based reasoning)",
        },
        "agents": [
            result.get("order_result", {}),
            result.get("safety_result", {}),
            result.get("ml_result", {}),
            result.get("inventory_result", {}),
            result.get("robot_result", {}),
            result.get("demand_result", {}),
            result.get("anomaly_result", {}),
            result.get("energy_result", {}),
            result.get("supervisor_result", {}),
        ],
        "trace": result.get("trace", []),
        "supervisor": result.get("supervisor_result", {}),
    }

    json_path = root / "ai_shortlist_output.json"
    json_path.write_text(json.dumps(output, indent=2, default=str), encoding="utf-8")

    if export_ergo:
        ergo_path = root / "ai_agents_shortlist.ergo"
        write_ergo_shortlist(output, ergo_path)

    return output


def format_report(output: dict[str, Any]) -> str:
    """Human-readable report."""
    lines = [
        "",
        "=" * 70,
        "  SMART WAREHOUSE - HuggingFace LLM Multi-Agent System",
        "  LangGraph + LangChain + HuggingFace + PyTorch + ErgoAI",
        "=" * 70,
        "",
        f"LLM Model: {output.get('llm_model', 'unknown')}",
        f"Agents: {len(output.get('agents', []))}",
        "",
        "-" * 70,
        "AGENT EXECUTION TRACE:",
        "-" * 70,
    ]
    for step in output.get("trace", []):
        lines.append(f"  {step}")

    for agent_data in output.get("agents", []):
        agent_name = agent_data.get("agent", "unknown")
        mode = agent_data.get("mode", "unknown")
        model = agent_data.get("model", "unknown")
        reasoning = agent_data.get("reasoning", "")

        lines.extend([
            "",
            "-" * 70,
            f"AGENT: {agent_name.upper()} (mode={mode}, model={model})",
            "-" * 70,
        ])

        for line in reasoning.split("\n")[:15]:
            lines.append(f"  {line}")
        if reasoning.count("\n") > 15:
            lines.append("  ... (truncated)")

    supervisor = output.get("supervisor", {})
    escalation = supervisor.get("escalation", False)
    lines.extend([
        "",
        "-" * 70,
        f"ESCALATION: {'YES - Critical conditions' if escalation else 'No - Normal operations'}",
        "-" * 70,
        "",
        "Stack: HuggingFace LLM + LangGraph + LangChain + PyTorch + ErgoAI",
        "Outputs: ai_shortlist_output.json, ai_agents_shortlist.ergo",
        "=" * 70,
        "",
    ])
    return "\n".join(lines)
