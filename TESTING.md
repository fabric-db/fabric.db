# fabric.db Test System

The repository includes a production-image acceptance harness for the governed state fabric.

## Run everything

```bash
make test
```

This builds the repository Dockerfile, starts the resulting SurrealDB image, loads the canonical schema and helper functions, runs a governed-state fixture, validates the relationships, restarts the database, and verifies persistence.

## Keep the test database alive

```bash
make test-db-keep
```

The container is exposed at `http://127.0.0.1:18000` by default.

Override the port if required:

```bash
FABRIC_TEST_PORT=28000 make test-db-keep
```

## What is covered

1. Production Docker image builds.
2. SurrealDB reaches the health endpoint.
3. Canonical tables are registered.
4. Helper functions load and execute.
5. Tenant, actor, agent, tool and policy records can be created.
6. Approval and decision records form a governed execution chain.
7. Event and provenance records provide traceability.
8. Desired and observed state can be represented.
9. Drift can be recorded against desired and observed state.
10. Data survives a database restart.

The deterministic fixture is in `tests/acceptance.surql` and the executable harness is `tests/run.sh`.

## CI

`.github/workflows/ci.yml` runs `make test-db` on pushes to `main`, pull requests and manual workflow dispatches.

## Rust workspace

Rust workspace testing is exposed separately:

```bash
make test-rust
```

This intentionally does not block the database acceptance command until all declared workspace crates are structurally complete.

## Environment knobs

- `FABRIC_TEST_IMAGE` — local test image name.
- `FABRIC_TEST_CONTAINER` — temporary container name.
- `FABRIC_TEST_VOLUME` — temporary Docker volume name.
- `FABRIC_TEST_PORT` — host port; default `18000`.
- `FABRIC_TEST_KEEP=1` — preserve the container and volume after the run.
- `SURREAL_USER` / `SURREAL_PASS` — test database root credentials.
- `SURREAL_NAMESPACE` / `SURREAL_DATABASE` — test namespace and database.
