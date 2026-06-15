# FabricDB Model Validation Report

Branch: `bootstrap/fabric-db-code`

## Status

The branch defines a protocol-first FabricDB model with boxes, nodes, agreements, tuplets, indexes, streams, profiles, and the Fabric Loop.

The model is coherent at the theory level but not yet publish-clean as a stable core release.

## Resolved chain

```text
Multimodel schemaless input
  -> index fill
  -> node identity and accessibility
  -> box boundary
  -> temporal agreement
  -> tuplet relation
  -> policy-bound bridge
  -> stream movement
  -> fabric loop
  -> stable state
```

## Canonical definitions

```text
Node = data point with unambiguous identity and accessibility.
Box = smallest indexed, locked, zero-touch building block of fabric.
Agreement = temporal governed bridge between nodes.
Tuplet = fine-grained relation object between two nodes.
Fabric = structured multimodel graph of nodes, agreements, tuplets, boxes, and streams.
FabricDB = structured multimodel graph database and completion engine.
Fabric Loop = reconciliation loop required for stable state.
```

## Stable invariants

- Protocol first.
- Open-source core.
- No vendor lock-in.
- Profiles are replaceable.
- Box is the building block.
- Every box is indexed.
- Every box is locked.
- Every box is zero-touch.
- Data moves packed in boxes.
- Box is the smallest event-stream unit.
- Agreement is temporal.
- Agreement constructs the bridge.
- Tuplets define relations.
- Everything is policy-bound.
- Time and location are primitives.
- Every path must be traversable.
- Events are replayable within declared capability.
- Zero loss, zero trust, zero touch.
- Stable core is mandatory.
- Stable state is the objective.

## Known unresolved or incomplete areas

### 1. License placeholder

`LICENSE` currently contains only a placeholder line. Replace with full Apache-2.0 text before publishing a stable release.

### 2. Missing or interrupted BF files

The following concepts were discussed but are not fully committed as canonical BF files:

- `bf/stream-core.bf`
- `bf/state-core.bf`
- `bf/fabric-core.bf`
- `bf/box-composition.bf`
- `bf/temporal-policy-law.bf`
- `bf/defined-not-fabricated.bf`
- `bf/box-build-artifact.bf`
- `bf/box-object-runtime.bf`
- `profiles/openfga-access-profile.bf`
- `profiles/spicedb-relation-profile.bf`
- `profiles/surrealdb-storage-profile.bf`
- `profiles/indexeddb-local-index-profile.bf`
- `profiles/dqlite-embedded-db-profile.bf`
- `profiles/gatekeeper-controller-profile.bf`

### 3. Conflicting node/fabric rule

`bf/fabricdb-node.bf` contains `every_node_is_fabric`. Later model refinement defines:

```text
Node = data point with identity and accessibility.
Fabric = structured graph of nodes.
```

Correct rule should be:

```text
Every node participates in fabric.
Every node is not the entire fabric.
```

### 4. Stub risk

The core should not include placeholder or partial implementation files. Reference implementation materials must stay under profiles or implementation folders.

### 5. BF grammar missing

The BF language has many examples but no formal grammar yet.

Needed:

- lexical rules
- declaration forms
- required/optional semantics
- invariant semantics
- profile semantics
- conformance semantics

## Publish readiness

Current readiness: draft architecture branch.

Not ready for stable merge until:

1. Full Apache-2.0 license is added.
2. Conflicting node/fabric rule is corrected.
3. Missing core primitives are added or explicitly deferred.
4. BF grammar is defined.
5. CI validates BF files for basic structure.
6. Profile files are separated from core files.
7. README is updated to point to the canonical model and validation report.

## Recommended next step

Create a pull request as draft, not final merge.

Title:

```text
Bootstrap FabricDB protocol core
```

Purpose:

```text
Define FabricDB as a protocol-first structured multimodel graph database built from indexed, locked, zero-touch boxes, temporal agreements, tuplets, policy-bound streams, and a reconciliation loop for stable state.
```
