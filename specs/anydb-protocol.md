# AnyDB Protocol

**Status:** Draft v0.1

AnyDB Protocol defines how databases, data services, agents, and operators participate in one governed Fabric without pretending every backend has identical behavior.

The protocol standardizes envelopes, capability declarations, state transitions, event records, policy decisions, evidence, and reconciliation contracts.

## Design goals

- Make heterogeneous data systems governable through one interface.
- Preserve provider-specific capabilities without hiding meaningful differences.
- Make every state transition attributable, auditable, replayable when supported, and reconcilable when declared.
- Support agents, operators, applications, and infrastructure controllers as first-class actors.
- Keep the protocol small enough for adapters to implement incrementally.

## Non-goals

- AnyDB is not a single universal query language.
- AnyDB does not require every provider to support every data model.
- AnyDB does not erase consistency, latency, or transaction differences.
- AnyDB does not replace physical database engines.

## Actors

| Actor | Meaning |
|---|---|
| Subject | Human, agent, service, operator, or organization requesting a transition |
| Provider | Database, storage engine, event system, index, or external service exposing AnyDB contracts |
| Adapter | Implementation layer that translates AnyDB contracts to provider-specific APIs |
| Policy engine | System that evaluates authorization, approval, and risk constraints |
| Reconciler | Control loop comparing desired state with observed state |
| Auditor | Human or system inspecting evidence, provenance, and decisions |

## Required envelopes

An AnyDB-compliant operation must carry enough context to explain who requested it, what changed, why it was allowed, and what evidence exists afterward.

### Command envelope

```json
{
  "schemaVersion": "anydb-command-v0.1",
  "commandId": "cmd_01HX0000000000000000000000",
  "tenantId": "tenant_acme",
  "workspaceId": "workspace_ops",
  "subject": {
    "type": "agent",
    "id": "agent_repair_001"
  },
  "intent": "resource.update",
  "target": {
    "provider": "example-provider",
    "model": "document",
    "resourceType": "ticket",
    "resourceId": "ticket_123"
  },
  "constraints": {
    "approvalRequired": true,
    "maxRisk": "medium"
  },
  "idempotencyKey": "idem_01HX0000000000000000000000",
  "requestedAt": "2026-06-15T00:00:00Z"
}
```

### State transition envelope

```json
{
  "schemaVersion": "anydb-transition-v0.1",
  "transitionId": "trn_01HX0000000000000000000000",
  "commandId": "cmd_01HX0000000000000000000000",
  "provider": "example-provider",
  "resource": {
    "type": "ticket",
    "id": "ticket_123"
  },
  "operation": "update",
  "beforeRef": "state://ticket_123@v3",
  "afterRef": "state://ticket_123@v4",
  "decisionRef": "decision://dec_01HX0000000000000000000000",
  "evidenceRefs": ["evidence://evd_01HX0000000000000000000000"],
  "occurredAt": "2026-06-15T00:00:01Z"
}
```

### Event envelope

```json
{
  "schemaVersion": "anydb-event-v0.1",
  "eventId": "evt_01HX0000000000000000000000",
  "transitionId": "trn_01HX0000000000000000000000",
  "tenantId": "tenant_acme",
  "provider": "example-provider",
  "type": "resource.updated",
  "subjectRef": "agent://agent_repair_001",
  "resourceRef": "resource://ticket/ticket_123",
  "sequence": 4,
  "idempotencyKey": "idem_01HX0000000000000000000000",
  "emittedAt": "2026-06-15T00:00:02Z"
}
```

## Policy decision record

A policy decision record links the requested action to the authorization and approval context that allowed or denied it.

```json
{
  "schemaVersion": "anydb-policy-decision-v0.1",
  "decisionId": "dec_01HX0000000000000000000000",
  "commandId": "cmd_01HX0000000000000000000000",
  "engine": "opa",
  "result": "allow",
  "matchedPolicies": ["policy://ticket-update-v1"],
  "approvals": ["approval://apr_01HX0000000000000000000000"],
  "decidedAt": "2026-06-15T00:00:00Z"
}
```

## Provider responsibilities

A provider or adapter must:

1. Publish an AnyDB provider capability declaration.
2. Accept or expose canonical identity references for subjects and resources.
3. Record state transitions for supported write operations.
4. Preserve audit and provenance records for governed transitions.
5. Return provider-specific limitations honestly.
6. Fail closed when required governance context is missing.
7. Emit events if `changeEvents` is declared.
8. Support drift reports if `driftDetection` is declared.
9. Support reconciliation actions if `reconciliation` is declared.

## Error model

AnyDB errors must be explicit and machine-readable.

```json
{
  "schemaVersion": "anydb-error-v0.1",
  "errorId": "err_01HX0000000000000000000000",
  "code": "POLICY_DENIED",
  "message": "The requested transition was denied by policy.",
  "retryable": false,
  "decisionRef": "decision://dec_01HX0000000000000000000000"
}
```

Recommended error codes:

- `CAPABILITY_UNSUPPORTED`
- `POLICY_DENIED`
- `APPROVAL_REQUIRED`
- `CONFLICT`
- `IDEMPOTENCY_CONFLICT`
- `SCHEMA_INVALID`
- `PROVIDER_UNAVAILABLE`
- `RECONCILIATION_REQUIRED`
- `EVIDENCE_MISSING`

## Compatibility

AnyDB compatibility is based on declared conformance profiles rather than vague compatibility claims. A provider is compatible with a profile only when it passes the required tests for that profile.

## Status

This is the initial draft of the AnyDB Protocol. The next step is to convert each envelope into JSON Schema and add conformance fixtures.
