# Ubuntu-Grounded Microbox Reference Profile

This document defines an Ubuntu reference profile for building a microbox from real operating system components.

Ubuntu is not a fabric.db core dependency.

fabric.db core remains vendor-neutral. Ubuntu, Canonical OpenStack, MicroStack, Snap, systemd, SurrealDB, and Landscape are implementation materials for this profile only.

## Core portability rule

```text
fabric.db core = portable contracts
Ubuntu profile = one replaceable implementation
Ubuntu 26/Core = contract target for this profile, not a core lock-in
```

The core defines what must be true.
The profile defines how one real-world stack can satisfy it.

## Ubuntu 26/Core contract stance

Treat Ubuntu 26/Core as a profile contract target.

That means:

- fabric.db core must not require Ubuntu
- microbox profile may target Ubuntu 26/Core
- Ubuntu 26/Core provides a reference operating substrate
- all profile assumptions must be replaceable
- conformance must be checked at the contract layer, not the vendor layer

## Reference ground-up mapping

```text
Hardware / VM
↓
Linux Kernel
↓
Ubuntu Core or Ubuntu Server profile
↓
Snap / systemd / OCI runtime boundary
↓
State store profile
↓
fabric.db kernel core
↓
Microfabric capability
↓
Microbox boundary
↓
Box edge
↓
Federation / landscape visibility
```

## Real-world Ubuntu profile materials

Ubuntu Core is positioned by Canonical for embedded, IoT, edge, robotics, industrial, automotive, signage, smart city, and medical device use cases. Ubuntu Core also has a certified hardware ecosystem.

Source: https://ubuntu.com/core

In Ubuntu Core, Canonical describes a clean separation between the kernel, OS image, and applications, each updated independently and protected against corruption.

Source: https://ubuntu.com/core

Canonical describes Ubuntu Core as a minimal, secure, strictly confined, immutable embedded Linux OS. It supports targeted production-ready images, OTA updates, air-gapped environments, fleet management, real-time operations, and long support windows.

Source: https://ubuntu.com/core

Canonical positions Ubuntu Server for enterprise data centers, public and private clouds, OpenStack clouds, Kubernetes clusters, and large scale-out workloads. Ubuntu Server LTS has a five-year standard security maintenance commitment for Main packages.

Source: https://ubuntu.com/server

Canonical describes Expanded Security Maintenance as extending Ubuntu and open source security maintenance up to 15 years. Ubuntu Pro also extends security maintenance coverage to Universe packages.

Source: https://ubuntu.com/security/esm

For Ubuntu Core, snap packaging is the native application delivery model. Canonical describes snaps as containerized packages for deploying embedded applications. Ubuntu Core architecture is built on snaps.

Source: https://ubuntu.com/core

Canonical describes OpenStack as providing a public-cloud-like experience while hosting applications in your own data center. Canonical also lists MicroStack as cloud-native OpenStack and MicroCloud as lightweight automated clouds.

Source: https://canonical.com/openstack

## State Store Profile

SurrealDB is a reference state-store profile, not a core requirement.

Other valid profiles may include:

- SQLite
- PostgreSQL
- FoundationDB
- append-only log plus object store
- embedded state engine

fabric.db core requires records for:

- identity
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

## fabric.db Kernel Core

fabric.db is not the Linux kernel.

It is the vendor-neutral governed state kernel that sits above an operating substrate and a state-store implementation.

It owns:

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

## Reference profiles

### Appliance Microbox on Ubuntu Core / Ubuntu 26 Core target

```text
Hardware / VM
Ubuntu Core profile
snap runtime
state-store profile
fabric.db kernel
microfabric
microbox edge
```

Best for:

- edge
- IoT
- air-gapped systems
- regulated device-like deployments
- sealed appliances

### Server Microbox on Ubuntu Server LTS / Ubuntu 26 LTS target

```text
Hardware / VM
Ubuntu Server LTS profile
systemd / OCI runtime
state-store profile
fabric.db kernel
microfabric
microbox edge
```

Best for:

- enterprise server deployments
- developer-friendly operations
- tenant-local state
- workspace-local state
- small production nodes

### Cloud Microbox on Canonical OpenStack / MicroStack

```text
Hardware cluster
Ubuntu Server profile
Canonical OpenStack / MicroStack profile
VM / container runtime
state-store profile
fabric.db kernel
microfabric
microbox edge
```

Best for:

- local cloud
- private cloud
- sovereign cloud
- edge infrastructure
- multi-tenant infrastructure

## Clean real-world formula

```text
Linux Kernel     = execution ground
Ubuntu           = reference operating substrate
Snap/systemd/OCI = runtime boundary options
State Store      = replaceable durable memory profile
fabric.db        = vendor-neutral governed state kernel
microfabric      = local governance capability
microbox         = accountable deployable unit
Landscape        = optional fleet / landscape visibility profile
```

## Principle

A microbox must be built from real substrate upward, but the core must remain portable.

Do not start with the agent.
Start with the ground.

Then add trust, runtime, state, governance, responsibility, edge, and federation.

No implementation material may define the shape of the core.
