#!/usr/bin/env python3
"""
Run the LangGraph + HuggingFace multi-agent warehouse pipeline.

Usage:
  python run_shortlist.py                                    # auto-detect LLM
  python run_shortlist.py --model microsoft/Phi-3-mini-4k-instruct  # specific HF model
  python run_shortlist.py --model mistralai/Mistral-7B-Instruct-v0.3
  python run_shortlist.py --no-ergo                          # skip Ergo export

If OPENAI_API_KEY is set, uses OpenAI. Otherwise downloads from HuggingFace.
If no GPU / no model available, falls back to structured analysis.
"""

from __future__ import annotations

import argparse
import sys

from ai_agents.pipeline import format_report, run_shortlist_pipeline


def main() -> int:
    parser = argparse.ArgumentParser(
        description="LangGraph + HuggingFace multi-agent warehouse system"
    )
    parser.add_argument(
        "--model",
        default="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
        help="HuggingFace model ID (default: TinyLlama/TinyLlama-1.1B-Chat-v1.0)",
    )
    parser.add_argument(
        "--no-ergo",
        action="store_true",
        help="Skip exporting ai_agents_shortlist.ergo",
    )
    args = parser.parse_args()

    output = run_shortlist_pipeline(
        model_id=args.model,
        export_ergo=not args.no_ergo,
    )
    print(format_report(output))
    return 0


if __name__ == "__main__":
    sys.exit(main())
