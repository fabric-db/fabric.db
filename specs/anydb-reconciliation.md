# AnyDB Reconciliation

**Status:** Draft v0.1

AnyDB Reconciliation defines how a provider reports drift between desired state and observed state, then applies governed repair actions through the Fabric.

Reconciliation is the control-loop contract for AnyDB. It makes heterogeneous databases operable as part of one governed state system.

## Core model

```text
Desired State
      |
      v
Observed State
      |
      v
Drift Report
      |
      v
Policy Decision
      |
      v
Reconciliation Action
      |
      v
State Transition + Evidence
```

## Terms

| Term | Meaning |
|---|---|
| Desired state | The intended state declared by a human, agent, operator, policy, or system |
| Observed state | The actual state reported by a provider or adapter |
| Drift | A meaningful difference between desired and observed state |
| Reconciliation action | A governed action intended to reduce or resolve drift |
| Repair | A reconciliation action that changes state |
| Dry run | A reconciliation simulation that produces no state change |

## Desired state record

```json
{
  "schemaVersion": "anydb-desired-state-v0.1",
  "desiredStateId": "dst_01HX0000000000000000000000",
  "tenantId": "tenant_acme",
  "provider": "example-provider",
  "resource": {
    "type": "ticket",
    "id": "ticket_123"
  },
  "spec": {
    "status": "resolved",
    "priority": "normal"
  },
  "declaredBy": "agent://agent_repair_001",
  "declaredAt": "2026-06-15T00:00:00Z"
}
```

## Observed state record

```json
{
  "schemaVersion": "anydb-observed-state-v0.1",
  "observedStateId": "obs_01HX0000000000000000000000",
  "desiredStateId": "dst_01HX0000000000000000000000",
  "tenantId": "tenant_acme",
  "provider": "example-provider",
  "resource": {
    "type": "ticket",
    "id": "ticket_123"
  },
  "state": {
    "status": "open",
    "priority": "high"
  },
  "observedAt": "2026-06-15T00:00:10Z"
}
```

## Drift report

```json
{
  "schemaVersion": "anydb-drift-report-v0.1",
  "driftReportId": "drf_01HX0000000000000000000000",
  "desiredStateId": "dst_01HX0000000000000000000000",
  "observedStateId": "obs_01HX0000000000000000000000",
  "tenantId": "tenant_acme",
  "resourceRef": "resource://ticket/ticket_123",
  "severity": "medium",
  "differences": [
    {
      "path": "/status",
      "desired": "resolved",
      "observed": "open"
    },
    {
      "path": "/priority",
      "desired": "normal",
      "observed": "high"
    }
  ],
  "reportedAt": "2026-06-15T00:00:11Z"
}
```

## Reconciliation action

```json
{
  "schemaVersion": "anydb-reconciliation-action-v0.1",
  "actionId": "rec_01HX0000000000000000000000",
  "driftReportId": "drf_01HX0000000000000000000000",
  "mode": "apply",
  "operation": "update",
  "patch": [
    { "op": "replace", "path": "/status", "value": "resolved" },
    { "op": "replace", "path": "/priority", "value": "normal" }
  ],
  "decisionRef": "decision://dec_01HX0000000000000000000000",
  "requestedBy": "agent://agent_repair_001",
  "requestedAt": "2026-06-15T00:00:12Z"
}
```

## Modes

| Mode | Meaning |
|---|---|
| `observe` | Read observed state only |
| `plan` | Produce drift and recommended actions |
| `dry-run` | Validate the action without changing state |
| `apply` | Execute the governed reconciliation action |

## Required behavior

A reconciled provider must:

1. Keep desired state and observed state distinguishable.
2. Report drift as structured differences.
3. Preserve evidence for observations and repairs.
4. Evaluate policy before applying repair actions.
5. Record repair actions as normal AnyDB state transitions.
6. Support idempotency for repair actions.
7. Expose deterministic results for repeated reconciliation attempts.

## Safety rules

- Reconciliation must never bypass policy.
- Missing identity context must stop reconciliation.
- Missing tenant context must stop reconciliation.
- Repair actions must be attributable to a subject.
- High-risk drift should require approval when policy requires it.
- Dry-run output must not mutate provider state.

## Relationship to agents

Agents may propose, plan, or request reconciliation. The provider remains responsible for enforcing the declared governance contract.

An agent repair loop should produce:

1. observed state
2. drift report
3. proposed action
4. policy decision
5. transition result
6. evidence
7. updated trust assertion

## Status

This is the initial reconciliation contract for AnyDB. The next step is to add JSON Schemas for desired state, observed state, drift report, and reconciliation action.
