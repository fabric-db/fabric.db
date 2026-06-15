#!/usr/bin/env python3
"""Validate AnyDB JSON fixtures without external dependencies."""

from __future__ import annotations

import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "examples" / "conformance" / "manifest.json"


REQUIRED_PROVIDER_CAPABILITIES = {
    "canonicalIdentity",
    "stateTransitions",
    "auditLog",
    "provenance",
}

ALLOWED_CONFORMANCE = {
    "anydb-core-v0.1",
    "anydb-event-v0.1",
    "anydb-trust-v0.1",
    "anydb-reconciled-v0.1",
}

ALLOWED_ADAPTER_LANGUAGES = {"rust", "go", "typescript", "python", "java", "other"}
ALLOWED_ADAPTER_RUNTIMES = {"native", "container", "wasm", "http", "grpc", "embedded"}


def load_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise AssertionError(f"{path}: invalid JSON: {exc}") from exc


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def validate_provider(path: Path) -> None:
    data = load_json(path)
    require(data.get("schemaVersion") == "anydb-provider-v0.1", f"{path}: wrong schemaVersion")
    require(data.get("provider"), f"{path}: missing provider")
    require(data.get("version"), f"{path}: missing version")
    require(isinstance(data.get("models"), list) and data["models"], f"{path}: models must be non-empty")
    require(data.get("conformance") in ALLOWED_CONFORMANCE, f"{path}: invalid conformance")

    capabilities = data.get("capabilities")
    require(isinstance(capabilities, dict), f"{path}: capabilities must be an object")
    missing = REQUIRED_PROVIDER_CAPABILITIES - set(capabilities)
    require(not missing, f"{path}: missing required capabilities: {sorted(missing)}")
    for name in REQUIRED_PROVIDER_CAPABILITIES:
        require(capabilities[name] is True, f"{path}: required capability {name} must be true")


def validate_domain(path: Path) -> None:
    data = load_json(path)
    require(data.get("schemaVersion") == "anydb-domain-v0.1", f"{path}: wrong schemaVersion")
    require(data.get("domain"), f"{path}: missing domain")
    require(data.get("displayName"), f"{path}: missing displayName")
    require(isinstance(data.get("records"), list) and data["records"], f"{path}: records must be non-empty")
    require(isinstance(data.get("requiredCapabilities"), list) and data["requiredCapabilities"], f"{path}: requiredCapabilities must be non-empty")


def validate_adapter(path: Path) -> None:
    data = load_json(path)
    require(data.get("schemaVersion") == "anydb-adapter-v0.1", f"{path}: wrong schemaVersion")
    require(data.get("adapter"), f"{path}: missing adapter")
    require(data.get("provider"), f"{path}: missing provider")
    require(data.get("version"), f"{path}: missing version")
    require(data.get("language") in ALLOWED_ADAPTER_LANGUAGES, f"{path}: invalid language")
    require(data.get("runtime") in ALLOWED_ADAPTER_RUNTIMES, f"{path}: invalid runtime")
    require(data.get("providerDeclaration"), f"{path}: missing providerDeclaration")
    require(data.get("conformance") in ALLOWED_CONFORMANCE, f"{path}: invalid conformance")
    require(isinstance(data.get("entrypoints"), dict) and data["entrypoints"], f"{path}: entrypoints must be non-empty")

    provider_declaration = ROOT / data["providerDeclaration"]
    require(provider_declaration.exists(), f"{path}: providerDeclaration does not exist")
    validate_provider(provider_declaration)


def validate_manifest() -> None:
    manifest = load_json(MANIFEST)
    require(manifest.get("schemaVersion") == "anydb-conformance-manifest-v0.1", "manifest: wrong schemaVersion")
    profiles = manifest.get("profiles")
    require(isinstance(profiles, list) and profiles, "manifest: profiles must be non-empty")

    for profile in profiles:
        name = profile.get("profile")
        require(name in ALLOWED_CONFORMANCE, f"manifest: invalid profile {name}")
        for fixture in profile.get("fixtures", []):
            path = ROOT / fixture
            require(path.exists(), f"manifest: missing fixture {fixture}")
            load_json(path)
        for fixture in profile.get("providerFixtures", []):
            path = ROOT / fixture
            require(path.exists(), f"manifest: missing provider fixture {fixture}")
            validate_provider(path)

    for fixture in manifest.get("domainFixtures", []):
        path = ROOT / fixture
        require(path.exists(), f"manifest: missing domain fixture {fixture}")
        validate_domain(path)

    for fixture in manifest.get("adapterFixtures", []):
        path = ROOT / fixture
        require(path.exists(), f"manifest: missing adapter fixture {fixture}")
        validate_adapter(path)


def main() -> int:
    try:
        validate_manifest()
    except AssertionError as exc:
        print(f"AnyDB validation failed: {exc}", file=sys.stderr)
        return 1
    print("AnyDB validation passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
