from dataclasses import dataclass, field
from datetime import datetime, timedelta
import math
import json

# ---------------------------------------------
# Trust Graph Engine v0.1 (UGD Extension)
# ---------------------------------------------

@dataclass
class TrustEdge:
    source: str
    target: str
    score: float  # 0.0 - 1.0
    interactions: int = 0
    violations: int = 0
    last_updated: datetime = field(default_factory=datetime.utcnow)

    def decay(self, half_life_days: int = 30):
        """Apply time-based trust decay"""
        days = (datetime.utcnow() - self.last_updated).days
        decay_factor = 0.5 ** (days / half_life_days)
        self.score *= decay_factor
        return self.score

    def update(self, success: bool):
        self.interactions += 1
        self.last_updated = datetime.utcnow()

        if success:
            self.score = min(1.0, self.score + 0.05)
        else:
            self.violations += 1
            self.score = max(0.0, self.score - 0.2)

        return self.score


class TrustGraph:
    """
    Global org-to-org + agent-to-agent trust system
    Used by Federation Router + UGD
    """

    def __init__(self):
        self.edges = {}  # key: (source, target)

    def _key(self, a, b):
        return f"{a}::{b}"

    def get_trust(self, source: str, target: str) -> float:
        key = self._key(source, target)
        edge = self.edges.get(key)
        if not edge:
            return 0.5  # neutral default trust
        edge.decay()
        return edge.score

    def record_interaction(self, source: str, target: str, success: bool):
        key = self._key(source, target)

        if key not in self.edges:
            self.edges[key] = TrustEdge(source, target, score=0.5)

        self.edges[key].update(success)

    def can_route(self, source: str, target: str, threshold: float = 0.6) -> bool:
        return self.get_trust(source, target) >= threshold

    def explain(self, source: str, target: str):
        key = self._key(source, target)
        edge = self.edges.get(key)

        if not edge:
            return {
                "source": source,
                "target": target,
                "trust": 0.5,
                "status": "unknown-edge"
            }

        return {
            "source": source,
            "target": target,
            "trust": edge.score,
            "interactions": edge.interactions,
            "violations": edge.violations,
            "last_updated": edge.last_updated.isoformat()
        }


# CLI test
if __name__ == "__main__":
    g = TrustGraph()

    g.record_interaction("orgA", "orgB", True)
    g.record_interaction("orgA", "orgB", True)
    g.record_interaction("orgA", "orgB", False)

    print(json.dumps(g.explain("orgA", "orgB"), indent=2))
