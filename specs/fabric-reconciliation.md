# Fabric Reconciliation

**Fabric Reconciliation** is the governed process that compares desired state with observed state, detects drift, evaluates policy, and drives the system toward trusted state.

It is not a retry loop. It is a **state convergence loop**.

```txt
Fabric Reconciliation =
  Desired State
+ Observed State
+ Drift Classification
+ Policy Evaluation
+ Decision
+ Repair Plan
+ Evidence
+ Assertion
+ Trusted State
```

## Definition

Fabric Reconciliation records how fabric.db identifies and resolves divergence between what should exist and what actually exists.

It answers:

1. what desired state was declared
2. what actual state was observed
3. what drift exists
4. which policy applies
5. what decision was made
6. what repair action is allowed
7. what evidence proves repair
8. what assertion certifies convergence
9. whether trusted state has been restored

## Canonical Shape

```json
{
  "kind": "FabricReconciliation",
  "version": "0.1.0",
  "id": "reconciliation_001",
  "subject": {
    "type": "FabricState",
    "id": "state_001"
  },
  "desired_state": {
    "status": "published"
  },
  "observed_state": {
    "status": "missing"
  },
  "drift": {
    "detected": true,
    "type": "missing_state",
    "severity": "medium"
  },
  "policy_evaluation": {
    "effect": "allow",
    "policies": ["policy_001"]
  },
  "decision": {
    "id": "decision_001",
    "outcome": "repair_allowed"
  },
  "repair_plan": {
    "required": true,
    "actions": ["create_missing_artifact", "capture_evidence", "assert_trusted_state"]
  },
  "evidence": {
    "refs": ["evidence_001"]
  },
  "assertions": {
    "refs": ["assertion_001"]
  },
  "final_state": {
    "status": "trusted",
    "converged": true
  }
}
```

## Drift Types

```txt
missing_state        = desired state does not exist
unexpected_state     = actual state differs from desired state
unauthorized_state   = actual state violates policy or contract
missing_evidence     = state exists but proof is absent
missing_assertion    = proof exists but trust statement is absent
stale_state          = state is no longer current
conflicting_state    = incompatible states exist
external_drift       = outside system changed state without governed command
```

## Outcomes

```txt
converged      = actual state matches desired trusted state
repairing      = repair is in progress
held           = waiting on evidence, assertion, or approval
denied         = repair is not permitted
escalated      = human or higher authority required
rolled_back    = prior trusted state restored
failed         = convergence could not be achieved
```

## Rules

1. Reconciliation must compare desired and observed state.
2. Drift must be explicitly classified.
3. Repair must pass policy evaluation.
4. Trusted convergence must reference evidence.
5. Trusted convergence should reference assertion.
6. Failed reconciliation must preserve audit trail.

## Final Definition

**Fabric Reconciliation is the governed convergence loop that turns drift into trusted state or an explicit held, denied, escalated, or failed outcome.**
