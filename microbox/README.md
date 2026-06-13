# Microbox Reference Build

A microbox is the smallest deployable accountable box.

This reference build uses Ubuntu as the trusted base and keeps fabric.db as the governed state kernel.

## Build targets

```text
Ubuntu Core Microbox     = appliance-grade sealed box
Ubuntu Server Microbox   = general-purpose server box
MicroStack Microbox      = local cloud box
```

## Recommended default

Use Ubuntu Core when the microbox must be sealed, appliance-like, edge-ready, and low-touch.

Use Ubuntu Server when the microbox must be general-purpose, easier to debug, and server-managed.

Use MicroStack when the microbox must host small cloud-like workloads locally.

## Reference architecture

```text
Microbox
├── Ubuntu base
├── fabric.db kernel
├── SurrealDB state store
├── OCI runtime
├── systemd or snap service
├── policy gate
├── event log
├── provenance trail
├── reconciliation loop
└── conformance check
```

## Principle

Ubuntu provides the stable operating substrate.

fabric.db provides the governed state kernel.

Microbox provides the accountable deployment boundary.
