# Fabric DB

**Fabric DB** is the governed state substrate that stores, links, verifies, and reconciles operational facts across agents, tools, policies, evidence, assertions, runtimes, and trusted state.

It is not just a database. It is a **contract-aware operational fabric for governed systems**.

```txt
Fabric DB =
  Identity
+ Contract
+ Policy
+ Command
+ Decision
+ Event
+ Evidence
+ Assertion
+ State
+ Reconciliation
+ Audit
```

## Definition

Fabric DB is the durable substrate for agentic operations.

It stores not only data, but the governed relationships that make data trustworthy:

1. who acted
2. what was requested
3. what authority applied
4. what policy decided
5. what changed
6. what evidence proves it
7. what assertion certifies it
8. what state exists now
9. what drift exists
10. what reconciliation is required

## Core Principle

```txt
Data becomes fact only when it is governed, evidenced, asserted, and reconcilable.
```

## Canonical Objects

```txt
AgentConstitution   = invariant rules
AgentMission        = purpose
AgentContract       = authority
AgentPolicy         = executable governance
AgentCommand        = governed request
AgentDecision       = judgment
AgentEvent          = observed change
AgentEvidence       = proof
AgentAssertion      = signed/verifiable trust statement
AgentState          = observed reality
AgentReconciliation = convergence record
```

## Fabric DB Responsibilities

Fabric DB is responsible for:

1. storing canonical governed objects
2. preserving relationships between objects
3. maintaining append-only decision and event history
4. linking evidence to claims
5. storing signed or verifiable assertions
6. tracking current, desired, and trusted state
7. detecting drift between desired and actual state
8. supporting reconciliation loops
9. exposing queryable operational truth
10. preserving audit and provenance

## Trust Chain

```txt
Command
   ↓
Decision
   ↓
Event
   ↓
Evidence
   ↓
Assertion
   ↓
State
   ↓
Trusted State
```

## State Chain

```txt
Desired State
      ↓ compare
Actual State
      ↓ detect
Drift
      ↓ decide
Reconciliation
      ↓ prove
Evidence
      ↓ certify
Assertion
      ↓ produce
Trusted State
```

## Minimal Record Shape

```json
{
  "kind": "FabricRecord",
  "version": "0.1.0",
  "id": "fabric_record_001",
  "type": "AgentState",
  "subject": {
    "type": "AgentCommand",
    "id": "cmd_001"
  },
  "links": [
    {
      "relation": "derived_from",
      "target": "AgentDecision:dec_001"
    },
    {
      "relation": "proven_by",
      "target": "AgentEvidence:evd_001"
    },
    {
      "relation": "certified_by",
      "target": "AgentAssertion:assertion_001"
    }
  ],
  "state": {
    "current": "published",
    "desired": "published",
    "trusted": true
  },
  "audit": {
    "created_at": "2026-06-07T00:00:00Z",
    "created_by": "agent:operator",
    "trace_id": "trace_001"
  }
}
```

## Fabric DB vs Traditional Database

| Traditional Database | Fabric DB |
|---|---|
| Stores data | Stores governed operational facts |
| Optimized for records | Optimized for relationships, proof, and state |
| State may be overwritten | State is evidenced and auditable |
| Trust is external | Trust is modeled directly |
| Policy may live outside | Policy is linked to decisions and state |
| Drift is application concern | Drift is first-class |

## Conformance Rules

A conformant Fabric DB implementation must satisfy these rules:

1. Every trusted state must reference evidence.
2. Every evidence-backed claim may be certified by assertion.
3. Every decision must reference a command, policy, or contract basis.
4. Every event must reference subject, cause, and trace.
5. Every reconciliation must compare desired and actual state.
6. Every destructive state change must preserve audit history.
7. Every assertion must identify authority, subject, claim, validity, and verification method.
8. Every record must be queryable by subject, trace, kind, and relationship.
9. No policy-bypassing state transition may become trusted.
10. No unverified claim may be promoted to trusted state.

## Final Definition

**Fabric DB is the governed state substrate that turns data, events, evidence, assertions, and reconciliation into trusted operational reality.**
