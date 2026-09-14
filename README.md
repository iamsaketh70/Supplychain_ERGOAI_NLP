# Neuro-Symbolic Multi-Agent Warehouse Optimization System

## Research Overview

**Role**: Research Assistant  
**Duration**: 1 Year  
**Domain**: AI/ML for Autonomous Warehouse Systems  
**Advisor/Lab**: Knowledgesystem Labs

---

## Abstract

This research develops a **hybrid neuro-symbolic AI system** for autonomous warehouse optimization that integrates formal logic reasoning (ErgoAI/Prolog), deep neural networks (PyTorch), and multi-agent orchestration (LangGraph/LangChain). The system deploys **13 specialized AI agents** coordinated through a stateful execution graph with conditional escalation routing. Five custom PyTorch architectures — LSTM with attention, Variational Autoencoder, Dueling Deep Q-Network, Transformer encoder, and Skip-gram embeddings — provide predictive intelligence that feeds into a symbolic logic engine enforcing safety constraints and operational rules. The framework demonstrates that combining connectionist and symbolic AI paradigms yields superior warehouse decision-making compared to either approach alone.

---

## Research Motivation & Problem Statement

Modern automated warehouses face a **multi-objective optimization challenge**:
- Fulfill orders efficiently while minimizing robot travel distance
- Maintain safety compliance (hazmat separation, temperature control, weight limits)
- Adapt product placement dynamically based on demand patterns
- Predict equipment failures before they cause downtime
- Optimize energy consumption across heterogeneous climate zones

Traditional approaches use either:
- **Pure rule-based systems** (rigid, cannot learn from data)
- **Pure ML systems** (no formal safety guarantees)

This research bridges both paradigms through a **neuro-symbolic architecture** where neural networks generate predictions that are verified and constrained by formal logic rules.

---

## Research Phases & Timeline

### Phase 1 (Months 1-3): Knowledge Representation & Logic Engine

**Objective**: Build formal warehouse domain model in ErgoAI (Flora-2/XSB Prolog)

**Work Completed**:
- Designed ontology for warehouse entities: 6x6 grid, 4 zone types (ambient, freezer, hazmat, high-humidity), 16 shelves, 50+ products, 2 autonomous robots
- Implemented 10 safety constraint rules with formal logical guarantees:
  - Hazmat reaction prevention (oxidizer + flammable proximity)
  - Spoilage detection (frozen items outside refrigeration)
  - Ergonomic compliance (heavy/fragile items on high shelves)
  - Humidity damage prevention (paper goods in humid zones)
  - Robot collision avoidance (spatial conflict detection)
  - Highway blockage prevention
  - Protocol enforcement (robot state machine validity)
- Built complete robot action system with precondition checking:
  - Movement with boundary/collision/swap detection
  - Shelf pickup/putdown with state verification
  - Order delivery with inventory tracking
- Developed order fulfillment simulation with transactional state updates

**Technologies**: ErgoAI, Flora-2, XSB Prolog, first-order logic, defeasible reasoning

---

### Phase 2 (Months 3-5): Machine Learning Feature Engineering

**Objective**: Train neural network to discover product co-purchase patterns from transaction data

**Work Completed**:
- Processed real e-commerce transaction dataset (UK Online Retail)
- Implemented **association rule mining** (Apriori algorithm via mlxtend)
- Designed and trained a **Skip-gram neural network** (TensorFlow/Keras):
  - Architecture: Embedding(vocab) -> Dense(128) -> Dense(vocab)
  - Trained on product co-occurrence windows
  - Generated 20,000+ co-purchase relationship pairs
- Built the **neuro-symbolic bridge**: exported neural predictions as Prolog-compatible facts that ErgoAI can reason over
- Developed ErgoAI rules that leverage ML facts:
  - `ml_recommend_move/3` — suggests relocating items closer to co-purchased partners
  - `ml_colocation_alert/4` — flags frequently-bought-together items in separate zones
  - `optimal_zone_for/3` — computes ideal zone placement per item
  - `ml_distance_alert/3` — identifies co-purchased items on physically distant shelves

**Technologies**: TensorFlow, Keras, scikit-learn, mlxtend, pandas, Word2Vec/Skip-gram

---

### Phase 3 (Months 5-8): Deep Learning Models (PyTorch)

**Objective**: Design and implement 5 PyTorch neural architectures for warehouse intelligence

**Models Developed**:

#### 3.1 DemandLSTM — Demand Forecasting
- **Architecture**: 2-layer LSTM (64 hidden units) + self-attention mechanism + fully-connected head
- **Task**: Predict 7-day demand per product from historical time series
- **Innovation**: Attention layer enables the model to weight recent vs. seasonal patterns
- **Training**: Synthetic demand data with seasonality, trend, and noise components

#### 3.2 AnomalyAutoencoder — Warehouse State Monitoring
- **Architecture**: Variational Autoencoder with reparameterization trick
- **Encoder**: Linear(32->64) + LeakyReLU + BN + Linear(64->32) -> mu/logvar(8-dim latent)
- **Decoder**: Linear(8->32) + LeakyReLU + BN + Linear(32->64) + Linear(64->32) + Sigmoid
- **Loss**: Reconstruction MSE + KL divergence
- **Task**: Detect anomalous warehouse states via reconstruction error threshold (95th percentile)
- **Input**: 32-dimensional state vector encoding zone utilization, temperatures, safety margins, robot battery levels

#### 3.3 DQNetwork — Robot Path Planning (Reinforcement Learning)
- **Architecture**: Dueling DQN with separate value and advantage streams
- **State space**: 12 dimensions (robot position, target, direction, obstacles, time budget)
- **Action space**: 4 discrete actions (up, down, left, right)
- **Training**: Epsilon-greedy exploration with experience replay buffer (10,000 capacity)
- **Environment**: Custom `WarehouseGridEnv` with obstacle avoidance on 6x6 grid
- **Target network**: Updated every 10 episodes for stability

#### 3.4 ProductEmbeddingNet — Knowledge Graph Reasoning
- **Architecture**: Skip-gram with negative sampling
- **Embedding dimension**: 32
- **Loss**: Positive pair sigmoid + negative sampling loss
- **Task**: Learn product similarity from co-purchase relationships
- **Application**: Discover hidden product clusters and identify misplaced inventory

#### 3.5 OrderTransformer — Batch Sequencing
- **Architecture**: Transformer encoder (4-head self-attention, 2 layers, d_model=64)
- **Input**: 8-feature order vectors (line count, zone spread, fragile, frozen, quantity, hazmat, distance, urgency)
- **Task**: Score orders for optimal processing sequence
- **Innovation**: Attention mechanism captures inter-order dependencies

**Technologies**: PyTorch, torch.nn, torch.optim, reinforcement learning, variational inference

---

### Phase 4 (Months 8-11): Multi-Agent System & Orchestration

**Objective**: Design 13-agent pipeline with LangGraph orchestration and LangChain tool integration

**Work Completed**:

#### Agent Design (13 Specialists)
| Phase | Agent | AI Method |
|-------|-------|-----------|
| Rule-based | Order Priority | Weighted scoring heuristic |
| Rule-based | Safety Compliance | Constraint violation detection |
| Rule-based | ML Layout Optimizer | Co-purchase graph analysis |
| Rule-based | Inventory Agent | Zone-partner alignment checking |
| Rule-based | Robot Dispatcher | Proximity optimization |
| PyTorch | Demand Forecasting | LSTM + attention inference |
| PyTorch | Anomaly Detection | VAE reconstruction scoring |
| PyTorch | Path Planning | DQN policy evaluation |
| PyTorch | Knowledge Graph | Embedding similarity search |
| Physics | Predictive Maintenance | Degradation modeling |
| Physics | Energy Optimization | Thermal utilization model |
| PyTorch | Order Sequencing | Transformer attention scoring |
| Meta | Supervisor | Conditional merge + escalation |

#### LangGraph State Machine
- Implemented `StateGraph` with typed state (all agent results tracked)
- **Conditional routing**: If anomaly detection or critical safety → escalated supervisor path
- State propagation enables downstream agents to use upstream results

#### LangChain Tool Framework (17 Tools)
- 9 core tools: order listing, safety alerts, ML recommendations, robot status
- 8 extended tools: demand prediction, anomaly detection, path planning, maintenance prediction, energy optimization, product similarity, order sequencing, knowledge graph analysis
- Optional **ReAct agent**: LLM-powered tool-calling agent that reasons over all 17 tools

#### Ergo Integration Layer
- Bidirectional bridge: Python reads Ergo facts → agents process → exports new Ergo facts
- Generated `ai_agents_shortlist.ergo` loadable directly into ErgoAI for logical verification

**Technologies**: LangGraph, LangChain, LangChain-OpenAI, StateGraph, conditional edges, ReAct pattern

---

### Phase 5 (Months 11-12): Integration, Testing & Documentation

**Objective**: End-to-end system validation and research documentation

**Work Completed**:
- Integrated all components into single `python run_shortlist.py` pipeline
- Validated full 13-agent execution trace
- Confirmed conditional escalation triggers correctly
- Documented architecture, models, and research contributions
- Prepared reproducible environment (requirements.txt)

---

## System Architecture

```
+=========================================================================+
|                    NEURO-SYMBOLIC AI WAREHOUSE SYSTEM                     |
+=========================================================================+
|                                                                          |
|  +-------------------+    +----------------------+    +---------------+  |
|  | DATA LAYER        |    | NEURAL LAYER         |    | LOGIC LAYER   |  |
|  | - Transaction DB  |--->| - Skip-gram (TF)     |--->| - ErgoAI      |  |
|  | - Warehouse State |    | - LSTM Forecaster    |    | - Safety Rules|  |
|  | - Robot Telemetry |    | - VAE Anomaly Det.   |    | - Robot FSM   |  |
|  |                   |    | - DQN Path Planner   |    | - Constraints |  |
|  |                   |    | - Transformer Seq.   |    |               |  |
|  |                   |    | - Product Embeddings |    |               |  |
|  +-------------------+    +----------------------+    +---------------+  |
|           |                         |                        |           |
|           v                         v                        v           |
|  +-------------------------------------------------------------------+  |
|  |              LANGGRAPH MULTI-AGENT ORCHESTRATION                    |  |
|  |                                                                    |  |
|  |  [Agent 1-5: Rule-Based]  -->  [Agent 7-13: PyTorch]              |  |
|  |                                       |                            |  |
|  |                              Conditional Routing                   |  |
|  |                         /                       \                  |  |
|  |            [Standard Supervisor]    [Escalated Supervisor]         |  |
|  +-------------------------------------------------------------------+  |
|                                    |                                     |
|                    +---------------+---------------+                     |
|                    |                               |                     |
|          [JSON Action Plan]            [Ergo Facts Export]               |
|                                                                          |
+=========================================================================+
```

---

## Key Research Contributions

1. **Neuro-Symbolic Integration Architecture**  
   Demonstrated bidirectional information flow between neural predictions and logical constraints — neural networks propose actions, logic engine verifies safety compliance.

2. **Multi-Model Deep Learning Pipeline**  
   Combined 5 distinct neural architectures (LSTM, VAE, DQN, Transformer, Skip-gram) within a unified agent framework, each specializing in different decision aspects.

3. **Conditional Agent Escalation**  
   Designed automatic escalation mechanism where anomaly detection triggers enhanced supervisor reasoning — a form of metacognitive AI behavior.

4. **Tool-Augmented Agent Framework**  
   Built 17 domain-specific LangChain tools enabling both rule-based agents and LLM-powered ReAct agents to query warehouse state programmatically.

5. **Reinforcement Learning for Warehouse Robotics**  
   Applied Dueling DQN with experience replay to warehouse grid navigation, demonstrating RL-based path planning that respects physical constraints.

6. **Transformer-Based Order Optimization**  
   Novel application of self-attention mechanism to order sequencing, where attention weights capture inter-order resource contention.

---

## Technical Specifications

| Metric | Value |
|--------|-------|
| Total AI agents | 13 |
| PyTorch model architectures | 5 |
| LangChain tools | 17 |
| ErgoAI safety rules | 10+ |
| Co-purchase ML pairs | ~20,000 |
| Warehouse entities modeled | 50+ products, 16 shelves, 4 zones, 2 robots |
| DQN state dimensions | 12 |
| LSTM hidden units | 64 |
| VAE latent dimensions | 8 |
| Transformer attention heads | 4 |
| Product embedding dimensions | 32 |
| Lines of code (Python) | ~2,500 |
| Lines of code (ErgoAI) | ~20,000 |

---

## Technologies & Frameworks

| Category | Technologies |
|----------|-------------|
| Logic Programming | ErgoAI, Flora-2, XSB Prolog |
| Deep Learning | PyTorch (LSTM, VAE, DQN, Transformer, Embeddings) |
| Machine Learning | TensorFlow/Keras (Skip-gram), scikit-learn, mlxtend |
| Agent Orchestration | LangGraph (StateGraph, conditional routing) |
| Tool Framework | LangChain (tools, ReAct agents, output parsers) |
| LLM Integration | LangChain-OpenAI (GPT-4o-mini) |
| Data Science | pandas, numpy, matplotlib |
| Reinforcement Learning | Custom environment, Dueling DQN, experience replay |

---

## How to Run

```bash
# Install all dependencies
pip install -r requirements.txt

# Run full 13-agent pipeline
python run_shortlist.py

# Run with LLM enrichment (optional)
set OPENAI_API_KEY=sk-...
python run_shortlist.py --llm

# Load in ErgoAI Studio
# ['warehouse_run.ergo'].
# ['ai_agents_shortlist.ergo'].
```

---

## Output

The system generates:
- `ai_shortlist_output.json` — Complete results from all 13 agents
- `ai_agents_shortlist.ergo` — Ergo-compatible facts for logic engine verification
- Console report with full agent execution trace and recommended actions

---

## Project Structure

```
WarehouseProject/
|-- warehouse_data.ergo              # Warehouse ontology (grid, zones, products, robots)
|-- warehouse_main.ergo              # 730 lines: safety rules, robot FSM, ML reasoning
|-- warehouse_run.ergo               # 20,000+ lines: combined bundle for ErgoAI
|-- ergo_facts_neural_network.ergo   # 20,000 ML co-purchase facts
|-- ml_model.ipynb                   # Skip-gram training (TensorFlow/Keras)
|-- ai_agents/
|   |-- pytorch_models.py           # 5 PyTorch architectures (380 lines)
|   |-- agents.py                   # 6 rule-based agents
|   |-- agents_extended.py          # 7 PyTorch-powered agents
|   |-- graph.py                    # LangGraph orchestration + conditional routing
|   |-- tools.py                    # 9 core LangChain tools
|   |-- tools_extended.py           # 8 extended LangChain tools
|   |-- knowledge.py                # Ergo fact parser (Python bridge)
|   |-- pipeline.py                 # Pipeline runner + report generator
|   |-- export_ergo.py              # Ergo fact exporter
|-- run_shortlist.py                # CLI entry point
|-- requirements.txt                # Dependencies
`-- README.md                       # Research documentation
```

---

## Publications / Presentations

- [Add any papers, posters, or presentations here]

---

## Future Work

- Integrate real-time sensor data streams for live anomaly detection
- Extend DQN to multi-robot cooperative path planning (MARL)
- Add graph neural networks for warehouse topology reasoning
- Deploy as microservice architecture for production warehouse integration
- Benchmark against commercial WMS (Warehouse Management Systems)
