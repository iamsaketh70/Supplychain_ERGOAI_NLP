"""
HuggingFace LLM-powered AI agents.

Each agent is a real LLM downloaded from HuggingFace, given a system prompt
that defines its role, and equipped with LangChain tools to query the warehouse.
The LLM reasons, calls tools, reads the results, and produces its analysis.

Works in two modes:
  - LOCAL mode: Downloads a HuggingFace model (e.g. microsoft/Phi-3-mini)
    and runs it locally with HuggingFacePipeline
  - API mode: Uses OpenAI API if OPENAI_API_KEY is set (faster for testing)
  - FALLBACK mode: If no GPU/LLM available, uses structured prompting with
    the pipeline to generate analysis from tool outputs
"""

from __future__ import annotations

import json
import os
from typing import Any

from langchain_core.messages import HumanMessage, SystemMessage


# ============================================================================
# Agent system prompts — each agent has a unique role/persona
# ============================================================================

AGENT_PROMPTS = {
    "order_priority": (
        "You are the Order Priority Agent in a smart warehouse multi-agent system. "
        "Your job is to analyze all current warehouse orders and rank them by fulfillment priority. "
        "Consider: number of zones to visit (fewer is better), fragile items (handle with care), "
        "frozen items (urgent - spoilage risk), and total line count. "
        "Use the available tools to inspect orders, then output a ranked shortlist with reasoning."
    ),
    "safety_compliance": (
        "You are the Safety Compliance Agent. Your job is to identify and prioritize ALL safety "
        "violations in the warehouse. This includes: hazmat reactions (oxidizer + flammable on same shelf), "
        "spoilage risks (frozen items outside freezer), heavy items on high shelves, paper goods in humid zones, "
        "and robot collision risks. Use the safety alert tools and provide severity-ranked remediation actions."
    ),
    "ml_layout": (
        "You are the ML Layout Optimization Agent. You use machine learning co-purchase data to "
        "recommend product placement changes. Items frequently bought together should be stored in the "
        "same zone to reduce picking time. Use the ML recommendation and colocation tools to identify "
        "the top layout improvements and explain the co-purchase reasoning behind each."
    ),
    "inventory": (
        "You are the Inventory Management Agent. Analyze product placement across the warehouse. "
        "Identify items that are misaligned with their co-purchase partners (stored in wrong zone), "
        "products at risk of stockout, and shelf utilization imbalances. Use knowledge graph and "
        "demand tools to build a comprehensive inventory health report."
    ),
    "robot_dispatcher": (
        "You are the Robot Dispatcher Agent. Your job is to assign warehouse robots to pending orders. "
        "Consider each robot's current position, proximity to picking stations, current load status, "
        "and maintenance health. Match robots to orders optimally to minimize travel distance. "
        "Use robot status, path planning, and maintenance tools."
    ),
    "demand_forecasting": (
        "You are the Demand Forecasting Agent. Predict which products will face stockouts in the "
        "next 7 days. Analyze current stock levels against predicted demand rates. Flag products "
        "with high restock urgency. Use demand prediction and inventory tools."
    ),
    "anomaly_detection": (
        "You are the Anomaly Detection Agent. Monitor the overall warehouse state for abnormal "
        "conditions. Check zone utilization balance, unusual safety alert patterns, and robot "
        "operational anomalies. Report any deviations from normal operating parameters."
    ),
    "energy_optimization": (
        "You are the Energy Optimization Agent. Analyze power consumption across all warehouse zones. "
        "Freezer zones (zone_C) and hazmat zones (zone_D) consume the most energy. Identify zones "
        "where power can be reduced based on current utilization. Recommend HVAC adjustments."
    ),
    "supervisor": (
        "You are the Supervisor Agent — the final decision maker in this multi-agent warehouse system. "
        "You receive analysis from all other agents (order priority, safety, ML layout, inventory, "
        "robot dispatch, demand forecast, anomaly detection, energy optimization). "
        "Synthesize their findings into a unified action plan. Prioritize safety-critical items first, "
        "then operational efficiency, then cost optimization. Output a clear executive summary."
    ),
}


# ============================================================================
# LLM loader — downloads from HuggingFace or falls back
# ============================================================================

_LLM_CACHE: dict[str, Any] = {}


def get_llm(model_id: str = "TinyLlama/TinyLlama-1.1B-Chat-v1.0"):
    """
    Load a HuggingFace model for agent reasoning.
    
    Tries in order:
      1. OpenAI API if OPENAI_API_KEY set (fastest)
      2. HuggingFace local model downloaded to disk
      3. Returns None (agents fall back to structured analysis)
    
    Recommended models:
      - CPU:  TinyLlama/TinyLlama-1.1B-Chat-v1.0 (1.1B, ~2GB)
      - GPU:  microsoft/Phi-3-mini-4k-instruct (3.8B)
      - GPU:  mistralai/Mistral-7B-Instruct-v0.3 (7B)
    """
    if model_id in _LLM_CACHE:
        return _LLM_CACHE[model_id]

    if os.getenv("OPENAI_API_KEY"):
        try:
            from langchain_openai import ChatOpenAI
            llm = ChatOpenAI(model="gpt-4o-mini", temperature=0)
            _LLM_CACHE[model_id] = llm
            print(f"[LLM] Using OpenAI API (gpt-4o-mini)")
            return llm
        except Exception:
            pass

    try:
        from langchain_huggingface import HuggingFacePipeline, ChatHuggingFace
        
        print(f"[LLM] Downloading {model_id} from HuggingFace...")
        hf_pipeline = HuggingFacePipeline.from_model_id(
            model_id=model_id,
            task="text-generation",
            pipeline_kwargs={
                "max_new_tokens": 256,
                "temperature": 0.1,
                "do_sample": True,
                "return_full_text": False,
            },
        )
        llm = ChatHuggingFace(llm=hf_pipeline)
        _LLM_CACHE[model_id] = llm
        print(f"[LLM] Model loaded: {model_id}")
        return llm
    except Exception as exc:
        print(f"[LLM] HuggingFace load skipped ({type(exc).__name__}). Using structured fallback.")
        _LLM_CACHE[model_id] = None
        return None


# ============================================================================
# Agent runner — sends prompt + tool data to LLM
# ============================================================================


def run_llm_agent(
    agent_name: str,
    tool_outputs: dict[str, str],
    model_id: str = "TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    use_llm: bool = False,
) -> dict[str, Any]:
    """
    Run a single LLM-powered agent.
    
    1. Gets the HuggingFace (or OpenAI) LLM
    2. Sends system prompt + tool data
    3. LLM reasons over the data and returns analysis
    4. If LLM unavailable, falls back to structured summary
    """
    system_prompt = AGENT_PROMPTS.get(agent_name, "You are a warehouse AI agent.")
    
    tool_data = "\n\n".join(
        f"=== {tool_name} ===\n{output}" 
        for tool_name, output in tool_outputs.items()
    )

    llm = get_llm(model_id) if use_llm else None

    if llm is not None:
        try:
            response = llm.invoke([
                SystemMessage(content=system_prompt),
                HumanMessage(content=(
                    "Analyze the following warehouse data from your tools and provide "
                    "your expert assessment. Be specific and actionable.\n\n"
                    f"{tool_data}"
                )),
            ])
            return {
                "agent": agent_name,
                "model": model_id if "huggingface" in str(type(llm).__module__).lower() else "openai/gpt-4o-mini",
                "reasoning": response.content,
                "tool_data": tool_outputs,
                "mode": "llm",
            }
        except Exception as exc:
            print(f"[WARN] LLM call failed for {agent_name}: {exc}")

    return {
        "agent": agent_name,
        "model": "structured_fallback",
        "reasoning": _structured_fallback(agent_name, tool_outputs),
        "tool_data": tool_outputs,
        "mode": "fallback",
    }


def _structured_fallback(agent_name: str, tool_outputs: dict[str, str]) -> str:
    """When no LLM is available, produce structured analysis from tool data."""
    lines = [f"[{agent_name.upper()} AGENT ANALYSIS]", ""]
    for tool_name, output in tool_outputs.items():
        lines.append(f"From {tool_name}:")
        for line in output.strip().split("\n")[:8]:
            lines.append(f"  {line.strip()}")
        lines.append("")
    lines.append(f"Assessment: Reviewed {len(tool_outputs)} data sources. See details above.")
    return "\n".join(lines)
