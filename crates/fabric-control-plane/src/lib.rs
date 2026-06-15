//! Fabric Control Plane v0.1
//! Policy engine + trust graph + schema governance core

use serde::{Serialize, Deserialize};
use std::collections::HashMap;
use uuid::Uuid;

/// -----------------------------
/// Policy Model (UGD)
/// -----------------------------
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Policy {
    pub policy_id: String,
    pub org: String,
    pub version: String,
    pub rules: Vec<Rule>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Rule {
    pub action: String,
    pub allow: bool,
    pub min_trust: f64,
}

/// -----------------------------
/// Trust Graph (Global Control Plane)
/// -----------------------------
#[derive(Debug, Clone, Default)]
pub struct TrustGraph {
    pub edges: HashMap<(String, String), f64>,
}

impl TrustGraph {
    pub fn set(&mut self, a: &str, b: &str, score: f64) {
        self.edges.insert((a.to_string(), b.to_string()), score);
    }

    pub fn get(&self, a: &str, b: &str) -> f64 {
        *self.edges.get(&(a.to_string(), b.to_string())).unwrap_or(&0.0)
    }
}

/// -----------------------------
/// Schema Registry (AnyDB Governance)
/// -----------------------------
#[derive(Debug, Clone, Default)]
pub struct SchemaRegistry {
    pub schemas: HashMap<String, String>,
}

impl SchemaRegistry {
    pub fn register(&mut self, name: &str, schema: &str) {
        self.schemas.insert(name.to_string(), schema.to_string());
    }
}

/// -----------------------------
/// Evaluation Result
/// -----------------------------
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EvaluationResult {
    pub allowed: bool,
    pub reason: String,
    pub trust_score: f64,
}

/// -----------------------------
/// Control Plane State
/// -----------------------------
#[derive(Debug, Clone, Default)]
pub struct ControlPlane {
    pub policies: HashMap<String, Policy>,
    pub trust_graph: TrustGraph,
    pub schemas: SchemaRegistry,
}

impl ControlPlane {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn register_policy(&mut self, policy: Policy) {
        self.policies.insert(policy.policy_id.clone(), policy);
    }

    pub fn evaluate(
        &self,
        org: &str,
        action: &str,
        source: &str,
        target: &str,
    ) -> EvaluationResult {
        let trust = self.trust_graph.get(source, target);

        for policy in self.policies.values() {
            if policy.org == org {
                for rule in &policy.rules {
                    if rule.action == action {
                        if trust < rule.min_trust {
                            return EvaluationResult {
                                allowed: false,
                                reason: "TRUST_TOO_LOW".to_string(),
                                trust_score: trust,
                            };
                        }
                        return EvaluationResult {
                            allowed: rule.allow,
                            reason: if rule.allow { "ALLOWED" } else { "POLICY_DENIED" }.to_string(),
                            trust_score: trust,
                        };
                    }
                }
            }
        }

        EvaluationResult {
            allowed: false,
            reason: "NO_POLICY_MATCH".to_string(),
            trust_score: trust,
        }
    }
}

/// -----------------------------
/// Utility
/// -----------------------------
pub fn new_policy(org: &str, version: &str, rules: Vec<Rule>) -> Policy {
    Policy {
        policy_id: Uuid::new_v4().to_string(),
        org: org.to_string(),
        version: version.to_string(),
        rules,
    }
}
