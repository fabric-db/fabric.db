# Hardware-Native Substrate Contract

fabric.db must be able to reason from the hardware boundary upward.

Hardware-native does not mean vendor-specific hardware.
It means the system can express the minimum substrate capabilities required for a microbox to run, govern, audit, and reconcile.

## Position

```text
hardware-native contract
↓
kernel.bf
↓
proto.bf
↓
contract profile
↓
implementation profile
↓
deployment
```

## Definition

A hardware-native substrate is any physical or virtual substrate that can expose the required execution, identity, isolation, time, storage, network, and recovery capabilities to a microbox.

It may be:

- bare metal
- virtual machine
- edge device
- IoT gateway
- appliance
- cloud instance
- private cloud node
- local server

## Core substrate capabilities

A valid hardware-native substrate must provide:

- compute
- memory
- persistent storage
- network interface
- clock
- entropy source
- boot boundary
- identity anchor
- isolation primitive
- recovery path
- observability signal

## Capability contract

```bf
hardware substrate.v1 {
  compute required
  memory required
  storage persistent required
  network optional
  clock required
  entropy required
  boot_boundary required
  identity_anchor recommended
  isolation required
  recovery required
  observability required
}
```

## Execution primitives

The substrate must support an execution primitive:

- process
- container
- VM
- unikernel
- appliance image
- snap
- service unit

## Identity anchors

A hardware-native substrate may expose identity through:

- TPM
- secure boot chain
- device certificate
- machine id
- attestation document
- signed image digest
- cloud instance identity

The core must not require a specific identity anchor.
The contract requires that an identity anchor can be declared and verified when present.

## Isolation primitives

A substrate may expose isolation through:

- MMU / process isolation
- namespaces
- cgroups
- AppArmor
- SELinux
- VM boundary
- container boundary
- snap confinement
- hardware partition

The core must not require a specific isolation mechanism.
The contract requires declared isolation semantics.

## Recovery primitives

A substrate may expose recovery through:

- reboot
- rollback
- snapshot
- immutable image refresh
- transactional update
- replacement node
- rehydrate from state

The core requires a recovery path, not a specific recovery product.

## Hardware-native microbox

A hardware-native microbox is a microbox whose boundary can be traced down to the substrate capabilities that make it executable and accountable.

```text
microbox
  requires hardware substrate contract
  requires kernel.bf governed state primitives
  requires proto.bf boundary protocols
```

## Non-goals

The hardware-native contract does not mandate:

- Ubuntu
- x86
- ARM
- TPM
- Kubernetes
- Docker
- Snap
- cloud provider identity
- a specific hypervisor
- a specific database

Those belong to profiles.

## Principle

The core must be able to ask:

```text
What is the ground?
What capabilities does the ground expose?
Can this box be identified, isolated, observed, recovered, and reconciled?
```

If the answer is yes, the substrate can host a microbox.
