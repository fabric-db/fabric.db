// agreement-chain.bf
// The agreement constructs the chain.

chain_model agreement_chain.v1 {
  definition "the agreement constructs the chain between nodes"

  requires node.v1
  requires tuplet_access_policy.v1

  chain {
    constructed_by agreement
    composed_of tuplets
    connects nodes
    preserves policy
    preserves access
    preserves proof
    preserves time
  }

  tuplet chain_link {
    left_node required
    agreement required
    right_node required
    access required
    policy_document required
    proof required
    time required
  }

  agreement {
    requires agreement_id
    requires parties
    requires terms
    requires scope
    requires validity
    requires holder
    requires evidence
  }

  invariant no_chain_without_agreement
  invariant agreement_constructs_chain
  invariant every_chain_link_is_tuplet
  invariant every_tuplet_is_policy_bound
  invariant every_tuplet_is_access_bound
  invariant every_tuplet_is_time_bound
  invariant no_ambiguous_chain
}
