# Fabric State

**Fabric State** is the governed representation of what currently exists, what should exist, and whether the observed condition can be trusted.

It is not just a row or document. It is an **evidence-backed operational reality record**.

```txt
Fabric State =
  Subject
+ Current State
+ Desired State
+ Trust Status
+ Evidence Links
+ Assertion Links
+ Policy Status
+ Drift Status
+ Trace
```

## Definition

Fabric State records the condition of an object in the fabric.

It answers:

1. what object is being observed
2. what state exists now
3. what state should exist
4. what evidence supports the observation
5. what assertions certify trust
6. whether policy permits the state
7. whether drift exists
8. what reconciliation is required

## Canonical Shape

```json
{
  "kind": "FabricState",
  "version": "0.1.0",
  "id": "state_001",
  "subject": {
    "type": "AgentCommand",
    "id": "cmd_001"
  },
  "current": {
    "status": "published"
  },
  "desired": {
    "status": "published"
  },
  "trust": {
    "status": "trusted",
    "basis": ["evidence_001", "assertion_001"]
  },
  "policy_status": {
    "effect": "allow",
    "policies": ["policy_001"]
  },
  "drift": {
    "detected": false,
    "type": null
  },
  "trace": {
    "trace_id": "trace_001"
  }
}
```

## State Classes

```txt
observed_state = raw observed condition
current_state  = latest accepted condition
desired_state  = target condition
trusted_state  = evidence-backed and assertion-certified condition
drift_state    = divergence between desired and actual state
```

## Rules

1. Trusted state must reference evidence.
2. Trusted state should reference at least one assertion.
3. Desired and current state must be comparable.
4. Drift must be explicit, not implied.
5. State history must be auditable.

## Final Definition

**Fabric State is the governed, evidence-backed representation of operational reality inside fabric.db.**
