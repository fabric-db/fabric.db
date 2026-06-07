# Fabric Vocabulary and BBL

BBL is the Box Building Language.

File extension:

```text
.bbl
```

BBL defines the vocabulary used to build boxes, agreements, tuplets, streams, and fabric structures.

## Language position

```text
BBL = Box Building Language
```

BBL is not an implementation language.
It is a protocol and contract language for describing fabric primitives.

## Core vocabulary

### Time

Time grounds reality.

Time moves forward.

### Location

Location grounds accessibility.

A fabric object must have a resolvable location or be explicitly marked unresolved.

### Node

A node is a data point with unambiguous identity and unambiguous accessibility.

### Box

A box is the smallest indexed, locked, zero-touch building block of fabric.

A box is the unit in which data moves and stays.

### Index

An index gives direct addressability to a fabric position.

No index, no reliable access.

### Agreement

An agreement is a temporal governed bridge between nodes.

Agreement constructs the chain.

### Tuplet

A tuplet is the fine-grained relation record between two nodes.

A tuplet carries relation, agreement, access, policy, proof, and time.

### Policy

Policy governs what may happen.

Everything is policy-bound.

### Stream

A stream is the only permitted movement mechanism.

Boxes receive streams and emit streams.

### State

State is recorded truth at a time boundary.

State is not permanent.
State expires.
State is reconciled.

### Fabric Loop

The Fabric Loop reconciles nodes and state in a mutually agreeable manner to produce stable state.

### Fabric

Fabric is a structured multimodel graph of nodes, boxes, agreements, tuplets, streams, policies, and state.

### FabricDB

FabricDB is a structured multimodel graph database and completion engine for fabric.

## Core laws

```text
Box is the building block.
Time and location are primitives.
Everything expires.
Everything is policy-bound.
Everything is fine-grained.
Data is defined, not fabricated.
Data moves packed in boxes.
Box is always locked.
Box is zero-touch.
Touch destroys the box.
Zero loss.
Zero trust.
Zero touch.
Stable core is mandatory.
Stable state is the objective.
```

## BBL declaration shape

```bbl
box invoice_123 {
  identity "box:invoice_123"
  index "idx:invoice_123"
  home "fabric://finance/invoice/123"
  state invoice_state
}

node vendor {
  identity "node:vendor"
  accessibility "fabric://party/vendor"
}

agreement payment_terms {
  parties vendor buyer
  valid_from "2026-06-07T00:00:00Z"
  expires_at "2026-12-31T23:59:59Z"
}

tuplet vendor_to_invoice {
  left vendor
  relation "issued"
  right invoice_123
  agreement payment_terms
  policy payment_policy
}
```

## UBL note

`ubl` may be reserved as Universal Box Language, but the canonical first language is BBL: Box Building Language.
