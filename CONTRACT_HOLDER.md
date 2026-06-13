# Contract Holder

A contract becomes real when there is a holder.

A contract holder is the accountable person, organization, foundation, project, legal entity, or governance body that accepts responsibility for a contract.

## Definition

A contract holder is the authority of record for a contract.

It can:

- publish the contract
- version the contract
- approve changes
- revoke obsolete versions
- define conformance expectations
- accept responsibility for interpretation
- appoint maintainers
- delegate implementation to profiles
- preserve provenance of decisions

## Why it matters

A protocol without a holder is a proposal.

A contract without a holder is an unsigned promise.

A profile without a holder is an implementation preference.

A deployment without a holder is an unmanaged risk.

## Holder types

A contract holder may be:

- individual maintainer
- project governance body
- open source foundation
- company
- standards working group
- public institution
- community DAO only if legally accountable
- consortium
- tenant organization
- regulated operator

## Contract holder record

```bf
contract_holder fabric_db_core.v1 {
  id required
  name required
  type required
  jurisdiction optional
  public_contact required
  governance_url required
  signing_key optional
  maintainers required
  decision_log required
  lifecycle required
}
```

## Required responsibilities

A contract holder must provide:

- identity
- contact
- governance process
- versioning process
- change approval process
- conformance policy
- dispute path
- archival path
- succession path

## Core rule

Every real contract must name a holder.

```text
protocol + holder = governed protocol
contract + holder = accountable contract
profile + holder = accountable implementation profile
```

## Holder boundary

The holder owns the contract definition.

The holder does not automatically own all implementations.

Implementers may build profiles that conform to the contract, but the holder preserves the contract's canonical meaning.

## Open source rule

For fabric.db core, the contract holder must preserve:

- open source access
- public review
- public version history
- forkability
- conformance transparency
- no mandatory proprietary control plane
- no vendor lock-in in the core

## Lifecycle

```text
draft
review
accepted
active
deprecated
superseded
retired
archived
```

## Principle

Contracts need custody.

The contract holder is the custodian of meaning, accountability, and continuity.
