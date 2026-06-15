# Canonical FabricDB Model

FabricDB is a protocol-first, open-source, vendor-neutral database model for turning incomplete multimodal graph data into structured, indexed fabric.

It fills the gap between real-world work and digital systems.

## Core thesis

```text
FabricDB converts schemaless multimodal graph data into schemaful fabric by filling every position with indexes and boxes.
```

## Definitions

### Node

A node is a data point with unambiguous identity and unambiguous accessibility.

A node must have:

- identity
- accessibility
- data
- state
- communication ability

### Box

A box is the smallest building block of fabric.

One work box is one real-world, real-time, tangible unit of work.

A box is:

- locked
- zero-touch
- stream-only
- encrypted by default
- agreement-bound
- identity-bearing
- time-bounded
- accountable

A box is the unit size in which data moves and stays.

Touching the box destroys the box.
Opening the box destroys the box.
A destroyed or tampered box is not accepted anywhere.

### Microbox

A microbox is the governed stream surface of a box.

It:

- receives streams
- emits streams
- exposes conformance
- exposes audit
- exposes agreement-bound views

### Blackbox

A blackbox is the sealed meaning core of a box.

It holds:

- decision principle
- encrypted state
- private context
- internal provenance

The blackbox is not directly opened or touched.

### Fabric

Fabric is a structured graph of nodes resembling real-world things and the relations between them.

Fabric has no bleeding edges.

Every edge is typed, agreement-bound, streamed, encrypted, and auditable.

### FabricDB

FabricDB is the database that persists and completes the fabric.

It stores:

- nodes
- boxes
- indexes
- states
- agreements
- relations
- branches
- links
- streams
- conformance evidence

## The complete model

```text
Real-world work
    ↓
Box
    ↓
Node identity + accessibility
    ↓
Indexed position
    ↓
Structured fabric graph
    ↓
FabricDB
```

## Index fill

FabricDB takes an incomplete graph and fills missing positions with indexes.

Each index gives a position:

- identity
- accessibility
- schema reference
- state reference
- provenance reference
- modality marker
- relation links

This converts schemaless graph data into schemaful fabric.

```text
Schemaless graph
    ↓
Index fill
    ↓
Box fill
    ↓
Schemaful fabric
```

## Streams

Boxes do not expose raw internals.

Boxes only:

- receive encrypted streams
- emit encrypted streams

Every stream must be:

- encrypted
- agreement-bound
- schema-bound
- auditable
- attributable
- replayable

## Agreements

Agreements govern how nodes, boxes, and streams may relate.

An agreement defines:

- parties
- terms
- scope
- validity
- holder
- evidence
- permissions

No agreement means no access.

## No trust

FabricDB assumes no implicit trust.

Trust is replaced by:

- identity
- agreement
- authorization
- encryption
- evidence
- conformance
- audit

## Storage and authorization profiles

The core is not any one product.

The core is the protocol and model.

Implementation profiles are replaceable.

### SurrealDB profile

SurrealDB can serve as a multimodel graph/state storage profile.

It may store:

- boxes
- nodes
- links
- agreements
- indexes
- streams
- state
- branches

SurrealDB is not the core.

### SpiceDB profile

SpiceDB can serve as a relationship authorization profile.

It may evaluate:

- node access
- box access
- stream permissions
- agreement relations
- holder permissions

SpiceDB is not the core.

### IndexedDB profile

IndexedDB can serve as a browser-local index/cache profile.

It may store:

- local indexes
- offline box references
- local node accessibility maps
- stream checkpoints

IndexedDB is not the core.

## OS core and box

OS core is the real execution boundary.

Box is the real work and meaning boundary.

A deployment contract may bind one OS core instance to one box boundary.

Both are real.

## Hardware-native substrate

A hardware-native substrate provides:

- compute
- memory
- storage
- clock
- entropy
- isolation
- recovery
- observability
- optional identity anchor

The core does not require a specific hardware, OS, database, cloud, runtime, or vendor.

## Core invariants

- protocol first
- open-source core
- no vendor lock-in
- profiles are replaceable
- every node has unambiguous identity
- every node has unambiguous accessibility
- every box is locked
- every box is zero-touch
- data moves by box
- data stays by box
- every stream is encrypted
- every stream is agreement-bound
- no implicit trust
- no bleeding edge
- schemaless becomes schemaful by index fill
- fabric is a structured graph of nodes

## Final formula

```text
Node = data point with identity and accessibility
Box = locked unit of work, data, and meaning
Stream = only movement between boxes
Agreement = authority for relation and exchange
Index = direct accessibility for graph position
Fabric = structured graph of nodes
FabricDB = schemaful index-filled memory of the fabric
```
