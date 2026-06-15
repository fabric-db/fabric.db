# 🌐 Fabric SDK & API Contract v0.1

## Purpose
This document defines the **developer-facing contract layer** for Fabric.

It exposes Fabric as a programmable system with:
- identity-aware APIs
- policy-governed execution
- trust-scored routing
- event-sourced state model

---

# 1. Core API Model

All interactions follow a single envelope:

```json
{
  "identity": "string",
  "org": "string",
  "intent": "string",
  "payload": {},
  "context": {},
  "signature": "string"
}
```

---

# 2. Execution Endpoint

## POST /fabric/execute

### Description
Submits a governed state transition request.

### Pipeline
```
PII Filter → UGD Policy → Trust Graph → AnyDB Mapping → Federation Router → Fabric Core
```

### Request
```json
{
  "identity": "user|agent|service",
  "org": "org-id",
  "intent": "data.query | data.write | agent.run | cross.org.request",
  "payload": {
    "query": "...",
    "data": {}
  },
  "context": {
    "location": "edge-node",
    "timestamp": "ISO-8601"
  },
  "signature": "ed25519-signature"
}
```

### Response
```json
{
  "status": "approved | denied | partial",
  "trust_score": 0.0,
  "policy_decision": "allow|deny|restrict",
  "event_id": "evt_123",
  "state_hash": "sha256",
  "reconciliation_id": "rec_456"
}
```

---

# 3. Event Model (Fabric Core)

All state changes are immutable events:

```json
{
  "event_id": "evt_123",
  "type": "STATE_TRANSITION",
  "identity": "agent-1",
  "org": "org-a",
  "before": {},
  "after": {},
  "policy": "ugd_decision_hash",
  "trust_score": 0.87,
  "timestamp": "ISO-8601",
  "provenance": {
    "pii_filtered": true,
    "anydb_mapped": true
  }
}
```

---

# 4. SDK (TypeScript Reference)

## Fabric Client

```ts
export class FabricClient {
  constructor(private endpoint: string, private signer: any) {}

  async execute(intent: string, payload: any, context: any) {
    const request = {
      identity: this.signer.identity,
      org: this.signer.org,
      intent,
      payload,
      context,
      signature: await this.signer.sign(payload)
    };

    const res = await fetch(`${this.endpoint}/fabric/execute`, {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify(request)
    });

    return res.json();
  }
}
```

---

# 5. Intent System

Supported intents:

## Data Layer
- data.query
- data.write
- data.transform

## Agent Layer
- agent.run
- agent.compose
- agent.memory.update

## Federation Layer
- cross.org.request
- cross.org.sync

---

# 6. Policy Contract (UGD Integration)

Every request MUST resolve:

- identity validity
- org membership
- role permissions
- data sensitivity class

Default rule:

> DENY unless explicitly allowed by UGD policy engine

---

# 7. Trust Scoring Contract

```text
Trust(A,B) = w1(interactions) - w2(violations) + w3(recency)
```

Used for:
- routing decisions
- cross-org permissions
- execution throttling

---

# 8. PII Contract

Before execution:
- detect PII fields
- tokenize or redact
- attach privacy metadata

Guarantee:
> No raw PII enters Fabric Core

---

# 9. Federation Contract

Cross-org flow:

```
Org A → Federation Router → Trust Evaluation → Org B
```

Direct org-to-org communication is forbidden.

---

# 10. Error Model

Standard errors:

- POLICY_DENIED
- TRUST_TOO_LOW
- PII_BLOCKED
- SCHEMA_INVALID
- RECONCILIATION_FAILED

---

# 11. Observability Hooks

Every execution emits:

- trace_id
- event_id
- policy_decision
- trust_score
- latency breakdown

---

# 12. Conclusion

Fabric SDK defines the system as:

> a programmable, governed, trust-aware execution layer for multi-organization state systems
