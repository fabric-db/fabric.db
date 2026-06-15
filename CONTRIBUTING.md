# Contributing

fabric.db is protocol-first, open-source core, and vendor-neutral.

Contributions must preserve the core invariants:

- protocol first
- open source core
- no vendor lock-in
- profiles are replaceable
- implementations must conform to contracts
- contracts must name a holder

## Contribution types

Accepted contribution types:

- protocol definitions
- kernel primitives
- contracts
- profiles
- conformance tests
- documentation
- reference implementations
- examples

## Core boundary

Do not add vendor-specific requirements to the core.

Vendor, OS, database, runtime, cloud, and hardware-specific material belongs in profiles.

## Review rule

Every change must answer:

1. Does this belong in protocol, contract, profile, implementation, or deployment?
2. Does this preserve portability?
3. Does this preserve open-source core?
4. Does this create hidden vendor lock-in?
5. Can conformance be tested?
