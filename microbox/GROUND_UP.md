# Microbox Ground-Up Stack

A microbox must be understood from the ground up.

The lower layers execute.
The middle layers stabilize.
The upper layers govern.
The edge layers expose accountability.

## Ground-up order

```text
0. Physical / Virtual Hardware
1. Linux Kernel
2. Ubuntu Base
3. Runtime Boundary
4. State Store
5. fabric.db Kernel Core
6. Microfabric Capability
7. Microbox Boundary
8. Box Edge
9. Federation Surface
10. Landscape Visibility
```

## 0. Physical / Virtual Hardware

This is the material substrate.

It provides:

- CPU
- memory
- disk
- network
- device access
- entropy
- clock

The box cannot govern what the substrate cannot execute.

## 1. Linux Kernel

The Linux kernel is the execution substrate.

It owns:

- processes
- memory isolation
- file systems
- networking
- devices
- namespaces
- cgroups
- capabilities
- syscalls

The Linux kernel is not the agent kernel.
It is the execution ground.

## 2. Ubuntu Base

Ubuntu is the trusted operating substrate.

It provides:

- distribution
- package lifecycle
- security updates
- service management
- trusted base images
- snap support
- AppArmor integration
- predictable operations

Recommended forms:

```text
Ubuntu Core   = sealed appliance microbox
Ubuntu Server = practical server microbox
MicroStack    = local cloud microbox
```

## 3. Runtime Boundary

The runtime boundary contains execution.

Implementation options:

- process
- systemd service
- container
- pod
- VM
- snap

The runtime boundary is not the full box.
It is the execution shell.

## 4. State Store

The state store holds durable state.

Default:

```text
SurrealDB
```

It stores:

- state
- events
- policies
- approvals
- decisions
- provenance
- desired state
- observed state
- drift
- reconciliation

## 5. fabric.db Kernel Core

The fabric.db kernel core governs state.

It owns the stable primitives:

- identity
- state
- events
- policy
- approvals
- decisions
- provenance
- drift
- reconciliation
- conformance

This is the governed state kernel.

## 6. Microfabric Capability

A microfabric is the smallest deployable governed kernel capability.

It provides local governance capability inside the box.

It can:

- identify actors
- apply policy
- record events
- record decisions
- preserve provenance
- detect drift
- expose conformance

## 7. Microbox Boundary

A microbox is the smallest deployable accountable boundary.

It contains the microfabric and gives it responsibility.

```text
microbox = boundary + local governed kernel capability
```

The boundary defines:

- inside
- outside
- owner
- tenant
- allowed input
- allowed output
- authority
- lifecycle

## 8. Box Edge

The box edge is where crossings happen.

Every crossing must be:

- typed
- validated
- attributed
- policy checked
- recorded
- replayable
- reconcilable

The edge contains:

- input port
- output port
- policy gate
- audit surface
- conformance surface

## 9. Federation Surface

The federation surface connects boxes without dissolving boundaries.

It provides:

- trust contract
- schema contract
- policy contract
- event exchange
- import validation
- export evidence

Federation is explicit cooperation, not uncontrolled mesh.

## 10. Landscape Visibility

Landscape visibility observes multiple fabrics and boxes.

It does not replace local accountability.

It provides:

- inventory
- topology
- conformance map
- drift map
- trust map
- health map

## Clean stack

```text
Landscape Visibility
Federation Surface
Box Edge
Microbox Boundary
Microfabric Capability
fabric.db Kernel Core
State Store
Runtime Boundary
Ubuntu Base
Linux Kernel
Hardware / VM
```

## Responsibility split

```text
Linux Kernel       = execution truth
Ubuntu             = operating trust
Runtime Boundary   = execution containment
State Store        = durable memory
fabric.db Kernel   = governed state logic
Microfabric        = local governance capability
Microbox           = deployable responsibility boundary
Box Edge           = accountable crossing
Federation         = explicit cooperation
Landscape          = observation and inventory
```

## Principle

Come from the ground up.

Do not put governance below execution.
Do not put applications below governance.
Do not let federation erase the box boundary.
