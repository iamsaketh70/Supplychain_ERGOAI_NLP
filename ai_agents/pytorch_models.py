"""
PyTorch Deep Learning Models for Smart Warehouse Optimization.

Models:
  1. DemandLSTM — LSTM-based demand forecasting per product
  2. AnomalyAutoencoder — Detects anomalous shelf/zone patterns
  3. DQNPathPlanner — Deep Q-Network for robot path planning
  4. ProductEmbedding — Word2Vec-style embeddings for product similarity
  5. WarehouseTransformer — Attention-based order sequencing
"""

from __future__ import annotations

import math
import random
from collections import deque
from typing import Any

import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim


# =============================================================================
# 1. DEMAND FORECASTING — LSTM
# =============================================================================


class DemandLSTM(nn.Module):
    """
    Multi-step demand forecasting using LSTM.
    Predicts future demand for each product based on synthetic historical patterns.
    """

    def __init__(self, input_size: int = 1, hidden_size: int = 64,
                 num_layers: int = 2, output_size: int = 1, dropout: float = 0.2):
        super().__init__()
        self.hidden_size = hidden_size
        self.num_layers = num_layers

        self.lstm = nn.LSTM(
            input_size=input_size,
            hidden_size=hidden_size,
            num_layers=num_layers,
            batch_first=True,
            dropout=dropout if num_layers > 1 else 0.0,
        )
        self.attention = nn.Linear(hidden_size, 1)
        self.fc = nn.Sequential(
            nn.Linear(hidden_size, 32),
            nn.ReLU(),
            nn.Dropout(dropout),
            nn.Linear(32, output_size),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        lstm_out, _ = self.lstm(x)
        attn_weights = F.softmax(self.attention(lstm_out), dim=1)
        context = torch.sum(attn_weights * lstm_out, dim=1)
        return self.fc(context)


class DemandForecaster:
    """Train and predict demand using DemandLSTM."""

    def __init__(self, seq_length: int = 30, forecast_horizon: int = 7):
        self.seq_length = seq_length
        self.forecast_horizon = forecast_horizon
        self.model = DemandLSTM(output_size=forecast_horizon)
        self.optimizer = optim.Adam(self.model.parameters(), lr=0.001)
        self.loss_fn = nn.MSELoss()
        self.trained = False

    def generate_synthetic_demand(self, n_products: int = 20,
                                  n_days: int = 365) -> np.ndarray:
        """Simulate daily demand with seasonality + trend + noise."""
        data = np.zeros((n_products, n_days))
        for i in range(n_products):
            base = random.uniform(3, 15)
            trend = random.uniform(-0.01, 0.03)
            seasonality = random.uniform(2, 8)
            phase = random.uniform(0, 2 * math.pi)
            for d in range(n_days):
                seasonal = seasonality * math.sin(2 * math.pi * d / 365 + phase)
                noise = random.gauss(0, 1.5)
                data[i, d] = max(0, base + trend * d + seasonal + noise)
        return data

    def train(self, demand_data: np.ndarray, epochs: int = 50) -> dict[str, float]:
        self.model.train()
        X, y = self._prepare_sequences(demand_data)

        dataset = torch.utils.data.TensorDataset(X, y)
        loader = torch.utils.data.DataLoader(dataset, batch_size=32, shuffle=True)

        losses = []
        for epoch in range(epochs):
            epoch_loss = 0.0
            for batch_x, batch_y in loader:
                self.optimizer.zero_grad()
                pred = self.model(batch_x)
                loss = self.loss_fn(pred, batch_y)
                loss.backward()
                self.optimizer.step()
                epoch_loss += loss.item()
            losses.append(epoch_loss / len(loader))

        self.trained = True
        return {"final_loss": losses[-1], "epochs": epochs, "convergence": losses[-1] < 5.0}

    def predict(self, recent_demand: np.ndarray) -> np.ndarray:
        self.model.eval()
        with torch.no_grad():
            x = torch.FloatTensor(recent_demand).unsqueeze(0).unsqueeze(-1)
            pred = self.model(x)
        return pred.numpy().flatten()

    def _prepare_sequences(self, data: np.ndarray) -> tuple[torch.Tensor, torch.Tensor]:
        X_list, y_list = [], []
        for product_data in data:
            for i in range(len(product_data) - self.seq_length - self.forecast_horizon):
                X_list.append(product_data[i:i + self.seq_length])
                y_list.append(
                    product_data[i + self.seq_length:i + self.seq_length + self.forecast_horizon]
                )
        X = torch.FloatTensor(np.array(X_list)).unsqueeze(-1)
        y = torch.FloatTensor(np.array(y_list))
        return X, y


# =============================================================================
# 2. ANOMALY DETECTION — Variational Autoencoder
# =============================================================================


class AnomalyAutoencoder(nn.Module):
    """
    Variational Autoencoder for warehouse state anomaly detection.
    Encodes shelf utilization, zone balance, and robot states.
    """

    def __init__(self, input_dim: int = 32, latent_dim: int = 8):
        super().__init__()
        self.encoder = nn.Sequential(
            nn.Linear(input_dim, 64),
            nn.LeakyReLU(0.2),
            nn.BatchNorm1d(64),
            nn.Linear(64, 32),
            nn.LeakyReLU(0.2),
        )
        self.fc_mu = nn.Linear(32, latent_dim)
        self.fc_logvar = nn.Linear(32, latent_dim)

        self.decoder = nn.Sequential(
            nn.Linear(latent_dim, 32),
            nn.LeakyReLU(0.2),
            nn.BatchNorm1d(32),
            nn.Linear(32, 64),
            nn.LeakyReLU(0.2),
            nn.Linear(64, input_dim),
            nn.Sigmoid(),
        )

    def encode(self, x: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor]:
        h = self.encoder(x)
        return self.fc_mu(h), self.fc_logvar(h)

    def reparameterize(self, mu: torch.Tensor, logvar: torch.Tensor) -> torch.Tensor:
        std = torch.exp(0.5 * logvar)
        eps = torch.randn_like(std)
        return mu + eps * std

    def decode(self, z: torch.Tensor) -> torch.Tensor:
        return self.decoder(z)

    def forward(self, x: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor, torch.Tensor]:
        mu, logvar = self.encode(x)
        z = self.reparameterize(mu, logvar)
        return self.decode(z), mu, logvar


class AnomalyDetector:
    """Train VAE on normal warehouse states, flag anomalies via reconstruction error."""

    def __init__(self, input_dim: int = 32, threshold_percentile: float = 95.0):
        self.model = AnomalyAutoencoder(input_dim=input_dim)
        self.optimizer = optim.Adam(self.model.parameters(), lr=0.001)
        self.threshold = 0.0
        self.threshold_percentile = threshold_percentile
        self.trained = False

    def vae_loss(self, recon_x: torch.Tensor, x: torch.Tensor,
                 mu: torch.Tensor, logvar: torch.Tensor) -> torch.Tensor:
        recon_loss = F.mse_loss(recon_x, x, reduction='sum')
        kl_loss = -0.5 * torch.sum(1 + logvar - mu.pow(2) - logvar.exp())
        return recon_loss + kl_loss

    def train(self, normal_states: np.ndarray, epochs: int = 100) -> dict[str, Any]:
        self.model.train()
        X = torch.FloatTensor(normal_states)
        dataset = torch.utils.data.TensorDataset(X)
        loader = torch.utils.data.DataLoader(dataset, batch_size=16, shuffle=True)

        for epoch in range(epochs):
            for (batch,) in loader:
                self.optimizer.zero_grad()
                recon, mu, logvar = self.model(batch)
                loss = self.vae_loss(recon, batch, mu, logvar)
                loss.backward()
                self.optimizer.step()

        self.model.eval()
        with torch.no_grad():
            recon, mu, logvar = self.model(X)
            errors = F.mse_loss(recon, X, reduction='none').mean(dim=1).numpy()
        self.threshold = float(np.percentile(errors, self.threshold_percentile))
        self.trained = True
        return {"threshold": self.threshold, "mean_error": float(errors.mean())}

    def detect(self, state_vector: np.ndarray) -> dict[str, Any]:
        self.model.eval()
        with torch.no_grad():
            x = torch.FloatTensor(state_vector).unsqueeze(0)
            recon, _, _ = self.model(x)
            error = F.mse_loss(recon, x).item()
        return {
            "reconstruction_error": error,
            "threshold": self.threshold,
            "is_anomaly": error > self.threshold,
            "anomaly_score": min(1.0, error / max(self.threshold, 1e-6)),
        }


# =============================================================================
# 3. DEEP Q-NETWORK — Robot Path Planning
# =============================================================================


class DQNetwork(nn.Module):
    """Dueling DQN architecture for robot navigation on warehouse grid."""

    def __init__(self, state_size: int = 12, action_size: int = 4, hidden: int = 128):
        super().__init__()
        self.feature = nn.Sequential(
            nn.Linear(state_size, hidden),
            nn.ReLU(),
            nn.Linear(hidden, hidden),
            nn.ReLU(),
        )
        self.value_stream = nn.Sequential(
            nn.Linear(hidden, 64),
            nn.ReLU(),
            nn.Linear(64, 1),
        )
        self.advantage_stream = nn.Sequential(
            nn.Linear(hidden, 64),
            nn.ReLU(),
            nn.Linear(64, action_size),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        features = self.feature(x)
        value = self.value_stream(features)
        advantage = self.advantage_stream(features)
        return value + advantage - advantage.mean(dim=-1, keepdim=True)


class ReplayBuffer:
    """Experience replay buffer for DQN training."""

    def __init__(self, capacity: int = 10000):
        self.buffer: deque = deque(maxlen=capacity)

    def push(self, state, action, reward, next_state, done):
        self.buffer.append((state, action, reward, next_state, done))

    def sample(self, batch_size: int) -> list:
        return random.sample(self.buffer, min(batch_size, len(self.buffer)))

    def __len__(self) -> int:
        return len(self.buffer)


class WarehouseGridEnv:
    """Simplified warehouse grid environment for RL training."""

    ACTIONS = [(0, 1), (0, -1), (1, 0), (-1, 0)]  # right, left, down, up

    def __init__(self, grid_size: int = 6, obstacles: list[tuple[int, int]] | None = None):
        self.grid_size = grid_size
        self.obstacles = set(obstacles or [])
        self.robot_pos = (0, 0)
        self.target_pos = (5, 5)
        self.steps = 0
        self.max_steps = 50

    def reset(self, target: tuple[int, int] | None = None) -> np.ndarray:
        self.robot_pos = (0, random.randint(0, self.grid_size - 1))
        self.target_pos = target or (
            random.randint(0, self.grid_size - 1),
            random.randint(0, self.grid_size - 1),
        )
        self.steps = 0
        return self._get_state()

    def step(self, action: int) -> tuple[np.ndarray, float, bool]:
        dx, dy = self.ACTIONS[action]
        nx, ny = self.robot_pos[0] + dx, self.robot_pos[1] + dy
        self.steps += 1

        if 0 <= nx < self.grid_size and 0 <= ny < self.grid_size:
            if (nx, ny) not in self.obstacles:
                self.robot_pos = (nx, ny)

        done = self.robot_pos == self.target_pos or self.steps >= self.max_steps
        reward = self._compute_reward(done)
        return self._get_state(), reward, done

    def _compute_reward(self, done: bool) -> float:
        if self.robot_pos == self.target_pos:
            return 10.0
        if self.steps >= self.max_steps:
            return -5.0
        dist = abs(self.robot_pos[0] - self.target_pos[0]) + abs(
            self.robot_pos[1] - self.target_pos[1]
        )
        return -0.1 - 0.05 * dist

    def _get_state(self) -> np.ndarray:
        state = np.zeros(12)
        state[0] = self.robot_pos[0] / self.grid_size
        state[1] = self.robot_pos[1] / self.grid_size
        state[2] = self.target_pos[0] / self.grid_size
        state[3] = self.target_pos[1] / self.grid_size
        state[4] = (self.target_pos[0] - self.robot_pos[0]) / self.grid_size
        state[5] = (self.target_pos[1] - self.robot_pos[1]) / self.grid_size
        dist = abs(state[4]) + abs(state[5])
        state[6] = dist
        state[7] = self.steps / self.max_steps
        for i, (dx, dy) in enumerate(self.ACTIONS):
            nx, ny = self.robot_pos[0] + dx, self.robot_pos[1] + dy
            state[8 + i] = 1.0 if (0 <= nx < self.grid_size and 0 <= ny < self.grid_size
                                    and (nx, ny) not in self.obstacles) else 0.0
        return state


class DQNPathPlanner:
    """Train DQN agent for optimal robot pathfinding in warehouse."""

    def __init__(self, grid_size: int = 6):
        self.grid_size = grid_size
        self.env = WarehouseGridEnv(grid_size=grid_size)
        self.policy_net = DQNetwork()
        self.target_net = DQNetwork()
        self.target_net.load_state_dict(self.policy_net.state_dict())
        self.optimizer = optim.Adam(self.policy_net.parameters(), lr=0.001)
        self.replay = ReplayBuffer()
        self.gamma = 0.99
        self.epsilon = 1.0
        self.epsilon_min = 0.01
        self.epsilon_decay = 0.995
        self.trained = False

    def train(self, episodes: int = 500, batch_size: int = 64) -> dict[str, Any]:
        rewards_history = []
        for ep in range(episodes):
            state = self.env.reset()
            total_reward = 0.0
            done = False

            while not done:
                action = self._select_action(state)
                next_state, reward, done = self.env.step(action)
                self.replay.push(state, action, reward, next_state, done)
                state = next_state
                total_reward += reward
                self._optimize(batch_size)

            rewards_history.append(total_reward)
            self.epsilon = max(self.epsilon_min, self.epsilon * self.epsilon_decay)

            if ep % 10 == 0:
                self.target_net.load_state_dict(self.policy_net.state_dict())

        self.trained = True
        return {
            "episodes": episodes,
            "avg_reward_last_50": float(np.mean(rewards_history[-50:])),
            "final_epsilon": self.epsilon,
            "success_rate": sum(1 for r in rewards_history[-50:] if r > 5) / 50,
        }

    def plan_path(self, start: tuple[int, int], target: tuple[int, int]) -> list[tuple[int, int]]:
        self.env.robot_pos = start
        self.env.target_pos = target
        self.env.steps = 0
        state = self.env._get_state()
        path = [start]

        for _ in range(self.env.max_steps):
            with torch.no_grad():
                q_values = self.policy_net(torch.FloatTensor(state).unsqueeze(0))
                action = q_values.argmax().item()
            state, _, done = self.env.step(action)
            path.append(self.env.robot_pos)
            if done:
                break
        return path

    def _select_action(self, state: np.ndarray) -> int:
        if random.random() < self.epsilon:
            return random.randint(0, 3)
        with torch.no_grad():
            q_values = self.policy_net(torch.FloatTensor(state).unsqueeze(0))
            return q_values.argmax().item()

    def _optimize(self, batch_size: int) -> None:
        if len(self.replay) < batch_size:
            return
        batch = self.replay.sample(batch_size)
        states, actions, rewards, next_states, dones = zip(*batch)

        states_t = torch.FloatTensor(np.array(states))
        actions_t = torch.LongTensor(actions).unsqueeze(1)
        rewards_t = torch.FloatTensor(rewards)
        next_states_t = torch.FloatTensor(np.array(next_states))
        dones_t = torch.FloatTensor(dones)

        current_q = self.policy_net(states_t).gather(1, actions_t).squeeze()
        with torch.no_grad():
            next_q = self.target_net(next_states_t).max(1)[0]
            target_q = rewards_t + self.gamma * next_q * (1 - dones_t)

        loss = F.smooth_l1_loss(current_q, target_q)
        self.optimizer.zero_grad()
        loss.backward()
        torch.nn.utils.clip_grad_norm_(self.policy_net.parameters(), 1.0)
        self.optimizer.step()


# =============================================================================
# 4. PRODUCT EMBEDDING — Skip-gram style
# =============================================================================


class ProductEmbeddingNet(nn.Module):
    """Neural embedding model for product co-purchase similarity."""

    def __init__(self, vocab_size: int, embedding_dim: int = 32):
        super().__init__()
        self.center_embedding = nn.Embedding(vocab_size, embedding_dim)
        self.context_embedding = nn.Embedding(vocab_size, embedding_dim)
        nn.init.xavier_uniform_(self.center_embedding.weight)
        nn.init.xavier_uniform_(self.context_embedding.weight)

    def forward(self, center: torch.Tensor, context: torch.Tensor,
                negatives: torch.Tensor) -> torch.Tensor:
        center_emb = self.center_embedding(center)
        context_emb = self.context_embedding(context)
        neg_emb = self.context_embedding(negatives)

        pos_score = torch.sum(center_emb * context_emb, dim=-1)
        pos_loss = -F.logsigmoid(pos_score)

        neg_score = torch.bmm(neg_emb, center_emb.unsqueeze(-1)).squeeze(-1)
        neg_loss = -F.logsigmoid(-neg_score).sum(dim=-1)

        return (pos_loss + neg_loss).mean()


class ProductEmbeddingModel:
    """Train product embeddings from co-purchase pairs."""

    def __init__(self, embedding_dim: int = 32):
        self.embedding_dim = embedding_dim
        self.vocab: dict[str, int] = {}
        self.idx_to_product: dict[int, str] = {}
        self.model: ProductEmbeddingNet | None = None
        self.trained = False

    def build_vocab(self, pairs: list[tuple[str, str]]) -> None:
        products = set()
        for a, b in pairs:
            products.add(a)
            products.add(b)
        self.vocab = {p: i for i, p in enumerate(sorted(products))}
        self.idx_to_product = {i: p for p, i in self.vocab.items()}

    def train(self, pairs: list[tuple[str, str]], epochs: int = 100,
              neg_samples: int = 5) -> dict[str, Any]:
        self.build_vocab(pairs)
        vocab_size = len(self.vocab)
        self.model = ProductEmbeddingNet(vocab_size, self.embedding_dim)
        optimizer = optim.Adam(self.model.parameters(), lr=0.01)

        indexed_pairs = [
            (self.vocab[a], self.vocab[b])
            for a, b in pairs
            if a in self.vocab and b in self.vocab
        ]

        losses = []
        for epoch in range(epochs):
            random.shuffle(indexed_pairs)
            epoch_loss = 0.0
            for i in range(0, len(indexed_pairs), 32):
                batch = indexed_pairs[i:i + 32]
                centers = torch.LongTensor([c for c, _ in batch])
                contexts = torch.LongTensor([ctx for _, ctx in batch])
                negs = torch.randint(0, vocab_size, (len(batch), neg_samples))

                optimizer.zero_grad()
                loss = self.model(centers, contexts, negs)
                loss.backward()
                optimizer.step()
                epoch_loss += loss.item()
            losses.append(epoch_loss)

        self.trained = True
        return {"vocab_size": vocab_size, "final_loss": losses[-1], "embedding_dim": self.embedding_dim}

    def get_embedding(self, product: str) -> np.ndarray | None:
        if not self.trained or product not in self.vocab:
            return None
        idx = self.vocab[product]
        with torch.no_grad():
            emb = self.model.center_embedding(torch.LongTensor([idx]))
        return emb.numpy().flatten()

    def most_similar(self, product: str, top_k: int = 5) -> list[tuple[str, float]]:
        if not self.trained or product not in self.vocab:
            return []
        emb = self.get_embedding(product)
        similarities = []
        for other, idx in self.vocab.items():
            if other == product:
                continue
            other_emb = self.get_embedding(other)
            sim = float(np.dot(emb, other_emb) / (np.linalg.norm(emb) * np.linalg.norm(other_emb) + 1e-8))
            similarities.append((other, sim))
        similarities.sort(key=lambda x: x[1], reverse=True)
        return similarities[:top_k]


# =============================================================================
# 5. WAREHOUSE TRANSFORMER — Order Sequencing via Attention
# =============================================================================


class OrderTransformer(nn.Module):
    """
    Transformer encoder for optimal order sequencing.
    Assigns priority scores to orders via multi-head self-attention.
    """

    def __init__(self, d_model: int = 64, nhead: int = 4, num_layers: int = 2,
                 input_features: int = 8):
        super().__init__()
        self.input_proj = nn.Linear(input_features, d_model)
        encoder_layer = nn.TransformerEncoderLayer(
            d_model=d_model, nhead=nhead, dim_feedforward=128,
            dropout=0.1, batch_first=True,
        )
        self.transformer = nn.TransformerEncoder(encoder_layer, num_layers=num_layers)
        self.output_head = nn.Sequential(
            nn.Linear(d_model, 32),
            nn.ReLU(),
            nn.Linear(32, 1),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        h = self.input_proj(x)
        h = self.transformer(h)
        return self.output_head(h).squeeze(-1)


class OrderSequencer:
    """Use transformer to learn optimal order processing sequence."""

    def __init__(self):
        self.model = OrderTransformer()
        self.optimizer = optim.Adam(self.model.parameters(), lr=0.001)
        self.trained = False

    def featurize_orders(self, orders_data: list[dict]) -> np.ndarray:
        features = []
        for order in orders_data:
            feat = [
                order.get("line_count", 0) / 10.0,
                order.get("zones", 0) / 4.0,
                order.get("fragile_count", 0) / 5.0,
                order.get("frozen_count", 0) / 3.0,
                order.get("total_qty", 0) / 20.0,
                order.get("hazmat_items", 0) / 3.0,
                order.get("distance_score", 0) / 10.0,
                order.get("urgency", 0.5),
            ]
            features.append(feat)
        return np.array(features, dtype=np.float32)

    def train(self, orders_batches: list[list[dict]], optimal_scores: list[list[float]],
              epochs: int = 200) -> dict[str, Any]:
        self.model.train()
        losses = []
        for epoch in range(epochs):
            epoch_loss = 0.0
            for orders, scores in zip(orders_batches, optimal_scores):
                X = torch.FloatTensor(self.featurize_orders(orders)).unsqueeze(0)
                y = torch.FloatTensor(scores).unsqueeze(0)
                self.optimizer.zero_grad()
                pred = self.model(X)
                loss = F.mse_loss(pred, y)
                loss.backward()
                self.optimizer.step()
                epoch_loss += loss.item()
            losses.append(epoch_loss / max(len(orders_batches), 1))

        self.trained = True
        return {"epochs": epochs, "final_loss": losses[-1]}

    def sequence(self, orders: list[dict]) -> list[tuple[int, float]]:
        self.model.eval()
        with torch.no_grad():
            X = torch.FloatTensor(self.featurize_orders(orders)).unsqueeze(0)
            scores = self.model(X).squeeze(0).numpy()
        ranked = sorted(enumerate(scores), key=lambda x: x[1], reverse=True)
        return [(idx, float(score)) for idx, score in ranked]
