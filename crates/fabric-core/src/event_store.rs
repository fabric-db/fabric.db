//! Fabric Event Store v0.1
//! Append-only event log for deterministic replay + reconciliation

use serde::{Deserialize, Serialize};
use std::sync::Mutex;

// -----------------------------
// Core Event Model
// -----------------------------

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FabricEvent {
    pub event_id: String,
    pub org: String,
    pub actor: String,
    pub action: String,
    pub payload: serde_json::Value,
    pub timestamp: i64,
}

// -----------------------------
// Event Store
// -----------------------------

#[derive(Clone)]
pub struct EventStore {
    inner: std::sync::Arc<Mutex<Vec<FabricEvent>>>,
}

impl EventStore {
    pub fn new() -> Self {
        Self {
            inner: std::sync::Arc::new(Mutex::new(Vec::new())),
        }
    }

    pub fn append(&self, event: FabricEvent) -> String {
        let mut log = self.inner.lock().unwrap();
        let id = event.event_id.clone();
        log.push(event);
        id
    }

    pub fn all(&self) -> Vec<FabricEvent> {
        self.inner.lock().unwrap().clone()
    }

    pub fn replay(&self) -> Vec<FabricEvent> {
        self.inner.lock().unwrap().clone()
    }

    pub fn by_org(&self, org: &str) -> Vec<FabricEvent> {
        self.inner
            .lock()
            .unwrap()
            .iter()
            .filter(|e| e.org == org)
            .cloned()
            .collect()
    }
}

/*
Design Notes:
- Append-only immutable log
- Replayable state reconstruction
- Foundation for distributed federation sync

Next:
- Kafka/NATS/SurrealDB backend
- Hash-chained event integrity
- Multi-node log replication
*/