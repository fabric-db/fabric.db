import re
import json
import hashlib
from datetime import datetime

# --- Simple PII detection rules (v0.1 baseline) ---
EMAIL_RE = re.compile(r"[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+")
PHONE_RE = re.compile(r"(\+?\d{1,3})?[-.\s]?\(?\d{2,4}\)?[-.\s]?\d{3,4}[-.\s]?\d{3,4}")


def hash_token(value: str) -> str:
    return hashlib.sha256(value.encode("utf-8")).hexdigest()[:16]


def detect_pii(text: str) -> dict:
    findings = {
        "email": EMAIL_RE.findall(text),
        "phone": PHONE_RE.findall(text),
    }
    return findings


def redact(text: str, findings: dict) -> str:
    redacted = text

    for email in findings.get("email", []):
        redacted = redacted.replace(email, f"[EMAIL_REDACTED:{hash_token(email)}]")

    for phone in findings.get("phone", []):
        if phone:
            redacted = redacted.replace(phone, f"[PHONE_REDACTED:{hash_token(phone)}]")

    return redacted


def gateway(payload: dict) -> dict:
    """
    PII Gateway (pre-UGD ingestion filter)
    """

    raw = json.dumps(payload)
    pii = detect_pii(raw)

    is_sensitive = bool(pii.get("email") or pii.get("phone"))

    processed = {
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "pii_detected": is_sensitive,
        "pii_summary": pii,
        "data": redact(raw, pii) if is_sensitive else payload,
        "mode": "redacted" if is_sensitive else "clean"
    }

    return processed


if __name__ == "__main__":
    sample = {
        "user": "test user",
        "email": "test@example.com",
        "action": "query"
    }

    print(json.dumps(gateway(sample), indent=2))
