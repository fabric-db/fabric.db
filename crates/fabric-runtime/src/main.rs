//! Fabric Runtime v0.1
//! Axum API layer wiring Control Plane + Core execution loop

use axum::{routing::{get, post}, Json, Router};
use serde::{Deserialize, Serialize};
use std::net::SocketAddr;

// NOTE: In full system, these would be imported from fabric-core and fabric-control-plane crates
// use fabric_core::FabricCore;
// use fabric_control_plane::ControlPlane;

#[derive(Debug, Deserialize)]
pub struct ExecuteRequest {
    pub org: String,
    pub action: String,
    pub source: String,
    pub target: String,
    pub payload: serde_json::Value,
}

#[derive(Debug, Serialize)]
pub struct ExecuteResponse {
    pub allowed: bool,
    pub reason: String,
}

#[derive(Debug, Serialize)]
pub struct Health {
    pub status: String,
    pub system: String,
}

// -----------------------------
// Mocked runtime state (wiring placeholder)
// -----------------------------

#[derive(Clone)]
pub struct RuntimeState;

impl RuntimeState {
    pub fn new() -> Self {
        Self
    }

    pub fn evaluate(&self, org: &str, action: &str, source: &str, target: &str) -> (bool, String) {
        // Placeholder: control-plane integration hook
        if action == "deny" {
            return (false, "POLICY_DENIED_RUNTIME".into());
        }

        if source == target {
            return (true, "SELF_TRUSTED".into());
        }

        (true, format!("EVAL_OK:{}:{}", org, action))
    }
}

async fn execute_handler(Json(req): Json<ExecuteRequest>) -> Json<ExecuteResponse> {
    let runtime = RuntimeState::new();

    let (allowed, reason) = runtime.evaluate(&req.org, &req.action, &req.source, &req.target);

    Json(ExecuteResponse { allowed, reason })
}

async fn health() -> Json<Health> {
    Json(Health {
        status: "ok".into(),
        system: "fabric-runtime-v0.1".into(),
    })
}

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/health", get(health))
        .route("/fabric/execute", post(execute_handler));

    let addr = SocketAddr::from(([0, 0, 0, 0], 8080));

    println!("🚀 Fabric Runtime listening on {}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}
