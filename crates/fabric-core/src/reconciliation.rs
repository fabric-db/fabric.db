//! Fabric Reconciliation Layer v0.3
//! CRDT + gossip + trust-weighted consensus + BFT-ready convergence engine

use crate::event_store::{EventStore, FabricEvent};
use serde::{Serialize, Deserialize};
use std::collections::{HashMap, HashSet};
use std::sync::{Arc, Mutex};

// -----------------------------
// Vector Clock (causal ordering)
// -----------------------------

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct VectorClock {
    pub clocks: HashMap<String, u64>,
}

impl VectorClock {
    pub fn tick(&mut self, node: &str) {
        *self.clocks.entry(node.to_string()).or_insert(0) += 1;
    }

    pub fn merge(&mut self, other: &VectorClock) {
        for (k, v) in &other.clocks {
            let entry = self.clocks.entry(k.clone()).or_insert(0);
            *entry = (*entry).max(*v);
        }
    }
}

// -----------------------------
// Trust Model (NEW)
// -----------------------------

#[derive(Clone)]
pub struct TrustModel {
    pub scores: Arc<Mutex<HashMap<String, f64>>>,
}

impl TrustModel {
    pub fn new() -> Self {
        Self {
            scores: Arc::new(Mutex::new(HashMap::new())),
        }
    }

    pub fn score(&self, node: &str) -> f64 {
        *self.scores.lock().unwrap().get(node).unwrap_or(&0.5)
    }

    pub fn update(&self, node: &str, delta: f64) {
        let mut map = self.scores.lock().unwrap();
        let entry = map.entry(node.to_string()).or_insert(0.5);
        *entry = (*entry + delta).clamp(0.0, 1.0);
    }
}

// -----------------------------
// CRDT State (LWW)
// -----------------------------

#[derive(Clone)]
pub struct CRDTState {
    pub data: Arc<Mutex<HashMap<String, (serde_json::Value, u64)>>>,
}

impl CRDTState {
    pub fn new() -> Self {
        Self {
            data: Arc::new(Mutex::new(HashMap::new())),
        }
    }

    pub fn apply(&self, key: String, value: serde_json::Value, ts: u64) {
        let mut map = self.data.lock().unwrap();
        match map.get(&key) {
            Some((_, existing_ts)) if *existing_ts >= ts => return,
            _ => {
                map.insert(key, (value, ts));
            }
        }
    }

    pub fn snapshot(&self) -> HashMap<String, serde_json::Value> {
        self.data
            .lock()
            .unwrap()
            .iter()
            .map(|(k, (v, _))| (k.clone(), v.clone()))
            .collect()
    }
}

// -----------------------------
// Peer View (Gossip Topology)
// -----------------------------

#[derive(Clone)]
pub struct PeerView {
    pub known_nodes: Arc<Mutex<HashSet<String>>>,
}

impl PeerView {
    pub fn new() -> Self {
        Self {
            known_nodes: Arc::new(Mutex::new(HashSet::new())),
        }
    }

    pub fn learn(&self, node: String) {
        self.known_nodes.lock().unwrap().insert(node);
    }

    pub fn peers(&self) -> Vec<String> {
        self.known_nodes.lock().unwrap().iter().cloned().collect()
    }
}

// -----------------------------
// Reconciler (v0.3)
// -----------------------------

#[derive(Clone)]
pub struct Reconciler {
    pub store: EventStore,
    pub state: CRDTState,
    pub clock: Arc<Mutex<VectorClock>>,
    pub peers: PeerView,
    pub trust: TrustModel,
}

impl Reconciler {
    pub fn new(store: EventStore) -> Self {
        Self {
            store,
            state: CRDTState::new(),
            clock: Arc::new(Mutex::new(VectorClock::default())),
            peers: PeerView::new(),
            trust: TrustModel::new(),
        }
    }

    // -----------------------------
    // Replay with trust weighting
    // -----------------------------

    pub fn replay(&self, node_id: &str) {
        let events = self.store.replay();
        self.clock.lock().unwrap().tick(node_id);

        for event in events {
            let ts = event.timestamp as u64;
            let node_trust = self.trust.score(&event.actor);

            // trust-weighted acceptance threshold
            let adjusted_ts = (ts as f64 * node_trust) as u64;

            self.state.apply(
                event.event_id.clone(),
                serde_json::json!({
                    "org": event.org,
                    "actor": event.actor,
                    "action": event.action,
                    "trust": node_trust
                }),
                adjusted_ts,
            );
        }
    }

    // -----------------------------
    // Gossip sync (enhanced)
    // -----------------------------

    pub fn gossip(&self, remote: Vec<FabricEvent>) {
        for event in remote {
            let ts = event.timestamp as u64;
            let trust = self.trust.score(&event.actor);
            let weighted = (ts as f64 * trust) as u64;

            self.state.apply(
                event.event_id.clone(),
                serde_json::json!({
                    "org": event.org,
                    "actor": event.actor,
                    "action": event.action,
                    "trust": trust
                }),
                weighted,
            );
        }
    }

    // -----------------------------
    // BFT-ready consensus check (simplified quorum model)
    // -----------------------------

    pub fn quorum_accept(&self, approvals: usize, total: usize) -> bool {
        if total == 0 {
            return false;
        }
        approvals as f64 / total as f64 >= 0.66
    }

    pub fn learn_peer(&self, node: String) {
        self.peers.learn(node);
    }

    pub fn cluster_view(&self) -> Vec<String> {
        self.peers.peers()
    }

    pub fn snapshot(&self) -> HashMap<String, serde_json::Value> {
        self.state.snapshot()
    }
}

/*
-------------------------------------------------
SYSTEM UPGRADE (v0.3)
-------------------------------------------------

✔ Trust-weighted reconciliation introduced
✔ Actor-based trust scoring integrated
✔ Weighted timestamps for convergence influence
✔ Quorum-based acceptance primitive (BFT seed)
✔ Gossip enhanced with trust bias

NEXT EVOLUTION:
- Replace heuristic trust model with Control Plane integration
- Add real BFT (PBFT / HotStuff-inspired flow)
- Add cryptographic event signatures
- Add anti-Byzantine anomaly detection
- Replace HashMap CRDT with full OR-Set
*/