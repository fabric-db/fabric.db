from datetime import datetime
from typing import List, Dict, Any

from tools.pii_gateway import gateway as pii_gateway
from tools.trust_graph import TrustGraph


class FederationRouter:
    """
    Federation Router v0.1

    Cross-organization governed data routing engine.
    Integrates:
    - PII Gateway (privacy filter)
    - UGD (policy enforcement placeholder)
    - Trust Graph (routing decisions)
    - AnyDB (semantic normalization placeholder)
    - Fabric (event emission)
    """

    def __init__(self, trust_graph: TrustGraph = None):
        self.trust_graph = trust_graph or TrustGraph()

    # -----------------------------
    # UGD POLICY LAYER (placeholder)
    # -----------------------------
    def enforce_ugd(self, source_org: str, target_org: str, payload: Dict[str, Any]) -> bool:
        """Minimal UGD policy gate (v0.1)"""
        # Deny if empty orgs
        if not source_org or not target_org:
            return False

        # Basic deny-by-default rule hook
        return True

    # -----------------------------
    # TRUST EVALUATION
    # -----------------------------
    def evaluate_targets(self, source_org: str, targets: List[str]) -> List[Dict[str, Any]]:
        results = []

        for t in targets:
            trust_score = self.trust_graph.get_trust(source_org, t)
            allowed = self.trust_graph.can_route(source_org, t)

            results.append({
                "target_org": t,
                "trust_score": trust_score,
                "allowed": allowed
            })

        # sort by trust score desc
        results.sort(key=lambda x: x["trust_score"], reverse=True)
        return results

    # -----------------------------
    # EVENT EMISSION (Fabric hook)
    # -----------------------------
    def emit_event(self, event: Dict[str, Any]) -> Dict[str, Any]:
        event["emitted_at"] = datetime.utcnow().isoformat() + "Z"
        event["layer"] = "fabric"
        return event

    # -----------------------------
    # MAIN ROUTER
    # -----------------------------
    def route(self, command: Dict[str, Any], source_org: str, target_orgs: List[str]) -> Dict[str, Any]:
        """
        Main routing function:
        command → PII → UGD → Trust → Routing decision
        """

        # 1. PII Gateway
        processed = pii_gateway(command)

        # 2. Trust evaluation
        evaluated = self.evaluate_targets(source_org, target_orgs)

        # 3. Filter allowed targets
        allowed_targets = []
        blocked_targets = []

        for t in evaluated:
            if t["allowed"] and self.enforce_ugd(source_org, t["target_org"], processed):
                allowed_targets.append(t)
            else:
                blocked_targets.append(t)

        # 4. Build decision
        decision = {
            "source_org": source_org,
            "allowed_targets": allowed_targets,
            "blocked_targets": blocked_targets,
            "processed_payload": processed,
            "timestamp": datetime.utcnow().isoformat() + "Z"
        }

        # 5. Emit Fabric event
        event = self.emit_event({
            "type": "FEDERATION_ROUTE_DECISION",
            "command": command,
            "decision": decision
        })

        decision["event"] = event

        return decision


# -----------------------------
# CLI TEST
# -----------------------------
if __name__ == "__main__":
    router = FederationRouter()

    test_command = {
        "user": "test",
        "email": "test@example.com",
        "action": "sync_data"
    }

    result = router.route(
        test_command,
        source_org="orgA",
        target_orgs=["orgB", "orgC", "orgD"]
    )

    import json
    print(json.dumps(result, indent=2))
