# Raspberry Pi Contract Profile

Raspberry Pi is a hardware-native contract profile for microbox deployments.

It is not part of the fabric.db core. It is one physical implementation profile that can satisfy the hardware-native substrate contract.

## Profile name

```text
raspberry-pi-profile.v1
```

## Purpose

Use this profile when a microbox must run on small, low-cost, ARM-based physical hardware.

Best for:

- edge microbox
- lab microbox
- local gateway
- sensor gateway
- offline-first node
- learning node
- appliance prototype
- small hardware-native deployment

## Contract position

```text
hardware-native contract
↓
raspberry-pi-profile.v1
↓
ubuntu-core-custom-profile or ubuntu-server-profile
↓
fabric.db kernel
↓
microfabric
↓
microbox
```

## Minimum recommended class

```text
Raspberry Pi 4 or newer
64-bit ARM OS
4 GB RAM minimum
8 GB RAM recommended
reliable power supply
reliable storage
wired network preferred
```

## Operating substrate options

Recommended profiles:

```text
Ubuntu Core custom profile
Ubuntu Server ARM64 profile
Linux PREEMPT_RT profile where realtime behavior matters
```

## Runtime options

A Raspberry Pi microbox may use:

- snap
- systemd service
- container
- podman
- k3s agent/server where appropriate
- bare process for minimal deployments

## State store options

Reference state stores:

- SurrealDB
- SQLite
- PostgreSQL on larger devices
- append-only local log plus sync

## Microbox requirements

The Raspberry Pi profile must satisfy:

- box identity
- boundary manifest
- state store
- event log
- policy gate
- provenance trail
- input port
- output port
- audit surface
- recovery path
- conformance report

## Realtime option

For robotics, control loops, industrial gateways, and deterministic timing, pair the Raspberry Pi profile with a Linux PREEMPT_RT profile.

```text
raspberry-pi-profile
+ linux-preempt-rt-profile
= realtime edge microbox profile
```

## Appliance option

For sealed appliance behavior, pair the Raspberry Pi profile with an Ubuntu Core custom profile.

```text
raspberry-pi-profile
+ ubuntu-core-custom-profile
= sealed edge appliance microbox
```

## Principle

Raspberry Pi provides a real physical ground for the microbox.

The core remains protocol-first and vendor-neutral.
