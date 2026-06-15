//! Fabric Core v0.1
//! Event-sourced state machine + trust-aware execution core

use serde::{Serialize, Deserialize};
use std::collections::HashMap;
use uuid::Uuid;

/// -----------------------------
/// Identity Model
/// -----------------------------
#[derive(Debug, Clone, Serialize, Deserialize, Hash, Eq, PartialEq)]
pub struct Identity {
    pub id: String,
    pub org: String,
    pub role: String,
}

/// -----------------------------
/// Core Event Model
/// -----------------------------
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Event {
    pub event_id: String,
    pub identity: Identity,
    pub event_type: String,
    pub payload: serde_json::Value,
    pub trust_score: f64,
    pub timestamp: i64,
}

impl Event {
    pub fn new(identity: Identity, event_type: &str, payload: serde_json::Value, trust_score: f64, timestamp: i64) -> Self {
        Self {
            event_id: Uuid::new_v4().to_string(),
            identity,
            event_type: event_type.to_string(),
            payload,
            trust_score,
            timestamp,
        }
    }
}

/// -----------------------------
/// State Model (Materialized View)
/// -----------------------------
#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct State {
    pub values: HashMap<String, serde_json::Value>,
}

impl State {
    pub fn apply(&mut self, event: &Event) {
        // deterministic projection rule
        self.values.insert(
            event.event_id.clone(),
            event.payload.clone(),
        );
    }
}

/// -----------------------------
/// Trust Engine (simplified)
/// -----------------------------
pub struct TrustEngine;

impl TrustEngine {
    pub fn score(identity: &Identity, _payload: &serde_json::Value) -> f64 {
        // deterministic placeholder trust model
        let base = 0.5;
        let role_factor = match identity.role.as_str() {
            "admin" => 0.9,
            "service" => 0.7,
            _ => 0.4,
        };
        (base + role_factor) / 2.0
    }
}

/// -----------------------------
/// Fabric Core Engine
/// -----------------------------
pub struct FabricCore {
    pub state: State,
    pub event_log: Vec<Event>,
}

impl FabricCore {
    pub fn new() -> Self {
        Self {
            state: State::default(),
            event_log: vec![],
        }
    }

    /// Execute a governed state transition
    pub fn execute(&mut self, identity: Identity, event_type: &str, payload: serde_json::Value, timestamp: i64) -> Event {
        let trust = TrustEngine::score(&identity, &payload);

        let event = Event::new(identity, event_type, payload, trust, timestamp);

        // append-only log
        self.state.apply(&event);
        self.event_log.push(event.clone());

        event
    }

    /// Rebuild state from event log (reconciliation)
    pub fn replay(events: &[Event]) -> State {
        let mut state = State::default();
        for e in events {
            state.apply(e);
        }
        state
    }
}
