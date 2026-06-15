//! Fabric Runtime v0.1
//! Axum API layer wiring Control Plane + Core execution loop

use axum::{routing::{get, post}, Json, Router};
use serde::{Deserialize, Serialize};
use std::net::SocketAddr;

// Wire Control Plane into runtime
use fabric_control_plane::{ControlPlane};

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
// Runtime State (now Control-Plane backed)
// -----------------------------

#[derive(Clone)]
pub struct RuntimeState {
    pub control_plane: ControlPlane,
}

impl RuntimeState {
    pub fn new() -> Self {
        let mut cp = ControlPlane::new();

        // minimal bootstrap policy (default allow rule for runtime bring-up)
        use fabric_control_plane::{new_policy, Rule};

        let policy = new_policy(
            "default",
            "0.1",
            vec![Rule {
                action: "*".to_string(),
                allow: true,
                min_trust: 0.0,
            }],
        );

        cp.register_policy(policy);

        Self {
            control_plane: cp,
        }
    }

    pub fn evaluate(&self, org: &str, action: &str, source: &str, target: &str) -> (bool, String) {
        let result = self.control_plane.evaluate(org, action, source, target);

        (result.allowed, result.reason)
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
        system: "fabric-runtime-v0.1-control-plane-wired".into(),
    })
}

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/health", get(health))
        .route("/fabric/execute", post(execute_handler));

    let addr = SocketAddr::from(([0, 0, 0, 0], 8080));

    println!("🚀 Fabric Runtime (Control Plane Wired) listening on {}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}
