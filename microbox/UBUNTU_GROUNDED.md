# Ubuntu-Grounded Microbox Definition

A microbox is a deployable accountable boundary built on real operating system components.

This document defines the microbox using Ubuntu and Canonical components as the real-world substrate.

## Ground-up mapping

```text
Hardware / VM
↓
Linux Kernel
↓
Ubuntu Core or Ubuntu Server
↓
Snap / systemd / OCI runtime boundary
↓
SurrealDB state store
↓
fabric.db kernel core
↓
Microfabric capability
↓
Microbox boundary
↓
Box edge
↓
Federation / Landscape visibility
```

## 1. Hardware / VM

Real-world thing:

- physical device
- server
- certified hardware
- VM
- edge node
- private cloud instance

Ubuntu Core is positioned for embedded, IoT, edge, robotics, industrial, automotive, signage, smart city, and medical device use cases. Ubuntu Core also has an explicit certified hardware ecosystem.

Source: https://ubuntu.com/core

## 2. Linux Kernel

Real-world thing:

- Ubuntu kernel
- device kernel
- real-time kernel where required
- kernel snap in Ubuntu Core

In Ubuntu Core, Canonical describes a clean separation between the kernel, OS image, and applications, each updated independently and protected against corruption.

Source: https://ubuntu.com/core

## 3. Ubuntu Base

Real-world thing:

- Ubuntu Core
- Ubuntu Server LTS
- Ubuntu Pro

### Ubuntu Core microbox

Use Ubuntu Core when the microbox must be appliance-like, immutable, strictly confined, edge-ready, OTA-updated, and fleet-managed.

Canonical describes Ubuntu Core as a minimal, secure, strictly confined, immutable embedded Linux OS. It supports targeted production-ready images, OTA updates, air-gapped environments, fleet management, real-time operations, and long support windows.

Source: https://ubuntu.com/core

### Ubuntu Server microbox

Use Ubuntu Server when the microbox must be a practical enterprise server unit.

Canonical positions Ubuntu Server for enterprise data centers, public and private clouds, OpenStack clouds, Kubernetes clusters, and large scale-out workloads. Ubuntu Server LTS has a five-year standard security maintenance commitment for Main packages.

Source: https://ubuntu.com/server

### Ubuntu Pro microbox

Use Ubuntu Pro when the microbox needs extended security and compliance coverage.

Canonical describes Expanded Security Maintenance as extending Ubuntu and open source security maintenance up to 15 years. Ubuntu Pro also extends security maintenance coverage to Universe packages.

Source: https://ubuntu.com/security/esm

## 4. Runtime Boundary

Real-world thing:

- snap
- systemd service
- container
- pod
- VM

For Ubuntu Core, snap packaging is the native application delivery model. Canonical describes snaps as containerized packages for deploying embedded applications. Ubuntu Core architecture is built on snaps.

Source: https://ubuntu.com/core

## 5. Local Cloud Boundary

Real-world thing:

- MicroStack
- Canonical OpenStack
- MicroCloud

Use MicroStack / Canonical OpenStack when the microbox must host local cloud-like workloads, VM lifecycle, private cloud infrastructure, sovereign cloud, or edge infrastructure.

Canonical describes OpenStack as providing a public-cloud-like experience while hosting applications in your own data center. Canonical also lists MicroStack as cloud-native OpenStack and MicroCloud as lightweight automated clouds.

Source: https://canonical.com/openstack

## 6. State Store

Real-world thing:

- SurrealDB local datastore
- database namespace
- append-only event tables
- desired and observed state records

In this repo, SurrealDB is the default implementation of the fabric.db governed state store.

fabric.db stores:

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

## 7. fabric.db Kernel Core

Real-world thing:

- schema
- contracts
- policy-bound records
- conformance checks
- reconciliation records

fabric.db is not the Linux kernel.

It is the governed state kernel that sits above Ubuntu and the state store.

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

## 8. Microfabric Capability

Real-world thing:

- local governance capability inside one deployment boundary

A microfabric is the smallest deployable governed kernel capability.

It can:

- identify actors
- apply policy
- record events
- record decisions
- preserve provenance
- detect drift
- expose conformance

## 9. Microbox Boundary

Real-world thing:

- one appliance
- one server instance
- one VM
- one snap-based device image
- one containerized runtime unit
- one local cloud unit
- one tenant-bound governed deployment

A microbox is the smallest deployable accountable boundary.

It wraps the microfabric capability with:

- identity
- owner
- tenant
- lifecycle
- allowed inputs
- allowed outputs
- authority boundary
- conformance surface

## 10. Box Edge

Real-world thing:

- API port
- event stream
- file import/export
- device interface
- service endpoint
- management endpoint

At the box edge, every crossing must be:

- typed
- validated
- attributed
- policy checked
- recorded
- replayable
- reconcilable

## 11. Fleet and Landscape Visibility

Real-world thing:

- Landscape
- fleet management
- remote access
- update visibility
- inventory

Canonical describes Ubuntu Core device management as reliable, remotely accessible, recoverable devices that remain up to date with mission-critical OTA updates in connected or air-gapped environments.

Source: https://ubuntu.com/core

Landscape is Canonical's machine management surface for monitoring and managing machines.

Source: https://ubuntu.com/core

## Recommended profiles

### Appliance Microbox

```text
Hardware / VM
Ubuntu Core
snap runtime
SurrealDB
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

### Server Microbox

```text
Hardware / VM
Ubuntu Server LTS
systemd / OCI runtime
SurrealDB
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

### Cloud Microbox

```text
Hardware cluster
Ubuntu Server
Canonical OpenStack / MicroStack
VM / container runtime
SurrealDB
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
Ubuntu           = trusted operating substrate
Snap/systemd/OCI = runtime boundary
SurrealDB        = durable governed memory
fabric.db        = governed state kernel
microfabric      = local governance capability
microbox         = accountable deployable unit
Landscape        = fleet / landscape visibility
```

## Principle

A microbox must be built from real substrate upward.

Do not start with the agent.
Start with the ground.

Then add trust, runtime, state, governance, responsibility, edge, and federation.
