// agreement-core.bf
// Agreement is temporal and recorded by time.

agreement agreement.v1 {
  definition "a temporal governed bridge between nodes"
  meaning "an agreement is recorded by time and is valid only within explicit temporal bounds"

  contains identity required
  contains parties required
  contains terms required
  contains scope required
  contains policy required
  contains access required
  contains proof required
  contains time required

  identity {
    requires agreement_id
    requires holder
    requires version
    requires lifecycle
  }

  parties {
    requires left_node
    requires right_node
    requires left_approval
    requires right_approval
  }

  terms {
    requires relation
    requires obligations
    requires constraints
    requires allowed_actions
    requires denied_actions
  }

  scope {
    requires subject
    requires object
    requires purpose
    requires boundary
  }

  policy {
    requires policy_document
    requires governance_policy_left
    requires governance_policy_right
    requires enforcement_profile optional
  }

  access {
    requires fine_grained_access_left
    requires fine_grained_access_right
    requires decision
  }

  proof {
    requires evidence
    requires provenance
    requires conformance
  }

  time {
    requires recorded_at
    requires valid_from
    requires valid_to optional
    requires observed_at
    requires expires_at optional
  }

  invariant agreement_is_temporal
  invariant agreement_is_recorded_by_time
  invariant agreement_requires_two_node_approval
  invariant agreement_constructs_bridge
  invariant no_bridge_without_valid_agreement
  invariant expired_agreement_cannot_construct_chain
  invariant agreement_preserves_provenance
}
