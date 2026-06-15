import json
import os
import sys
from datetime import datetime

REQUIRED_FILES = [
    "ANYDB_PROTOCOL.md",
    "schemas/anydb-protocol.schema.json",
    "specs/ugd.md"
]


def load_json(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def check_files_exist():
    missing = []
    for f in REQUIRED_FILES:
        if not os.path.exists(f):
            missing.append(f)
    return missing


def validate_schema():
    try:
        schema = load_json("schemas/anydb-protocol.schema.json")
    except Exception as e:
        return False, f"Schema load failed: {e}"

    required = schema.get("required", [])
    if not required:
        return False, "Schema missing required fields"

    return True, "Schema OK"


def validate_protocol_doc():
    try:
        with open("ANYDB_PROTOCOL.md", "r", encoding="utf-8") as f:
            content = f.read()
    except Exception as e:
        return False, f"Protocol doc missing: {e}"

    keywords = ["command", "decision", "event", "reconciliation"]
    missing = [k for k in keywords if k.lower() not in content.lower()]

    if missing:
        return False, f"Protocol missing concepts: {missing}"

    return True, "Protocol OK"


def validate_ugd():
    try:
        with open("specs/ugd.md", "r", encoding="utf-8") as f:
            content = f.read()
    except Exception as e:
        return False, f"UGD missing: {e}"

    required = ["identity", "policy", "command", "state", "reconciliation"]
    missing = [k for k in required if k.lower() not in content.lower()]

    if missing:
        return False, f"UGD missing concepts: {missing}"

    return True, "UGD OK"


def main():
    print("=== AnyDB Conformance Validator ===")
    print(f"Time: {datetime.utcnow().isoformat()}Z")

    missing = check_files_exist()
    if missing:
        print("Missing required files:", missing)
        sys.exit(1)

    ok, msg = validate_schema()
    print("Schema:", msg)
    if not ok:
        sys.exit(1)

    ok, msg = validate_protocol_doc()
    print("Protocol:", msg)
    if not ok:
        sys.exit(1)

    ok, msg = validate_ugd()
    print("UGD:", msg)
    if not ok:
        sys.exit(1)

    print("\n✔ All AnyDB + UGD conformance checks passed")


if __name__ == "__main__":
    main()
