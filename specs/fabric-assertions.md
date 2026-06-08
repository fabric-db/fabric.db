# Fabric Assertions

**Fabric Assertions** are verifiable trust statements stored by fabric.db.

They certify claims about identity, authority, policy, evidence, state, provenance, runtime conformance, and reconciliation.

## Definition

A Fabric Assertion is a structured statement that can be verified independently from the component that produced it.

```txt
Fabric Assertion =
  Type
+ Authority
+ Subject
+ Claim
+ Evidence
+ Signature or Verification Method
+ Validity
+ Revision
+ Revocation Status
```

## Canonical Shape

```json
{
  "kind": "FabricAssertion",
  "version": "0.1.0",
  "id": "assertion_001",
  "type": "fabric.state.trusted",
  "authority": {
    "type": "organization",
    "id": "fabric-db",
    "role": "assertion_authority"
  },
  "subject": {
    "type": "FabricState",
    "id": "state_001"
  },
  "claim": {
    "statement": "State is backed by evidence and policy-compliant reconciliation.",
    "status": "asserted"
  },
  "evidence": {
    "refs": ["evidence_001"]
  },
  "verification": {
    "method": "signature_and_evidence_check",
    "status": "verified"
  },
  "validity": {
    "not_before": "2026-06-07T00:00:00Z",
    "not_after": null,
    "revoked": false
  },
  "revision": 1
}
```

## Assertion Types

```txt
fabric.identity.verified
fabric.contract.authorized
fabric.policy.enforced
fabric.command.accepted
fabric.decision.recorded
fabric.event.observed
fabric.evidence.verified
fabric.state.trusted
fabric.reconciliation.complete
fabric.runtime.conformant
fabric.artifact.provenance
```

## Rules

1. No assertion may be trusted without authority.
2. No trust assertion may be accepted without evidence or verification method.
3. Revoked assertions must not elevate trust.
4. Assertions must be revisioned.
5. Assertions must be auditable by subject, claim, authority, and trace.

## Final Definition

**Fabric Assertions turn evidence-backed claims into portable, verifiable trust statements.**
