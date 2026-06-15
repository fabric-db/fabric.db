// tuplet-access-policy.bf
// Two nodes are related with tuplets carrying fine-grained access and policy.

relation_model tuplet_access_policy.v1 {
  definition "two nodes are related with tuplets that include fine-grained access and a policy document between them"

  tuplet node_relation {
    left_node required
    relation required
    right_node required
    agreement required
    access required
    policy_document required
    proof required
    time required
  }

  left_node {
    requires identity
    requires accessibility
  }

  right_node {
    requires identity
    requires accessibility
  }

  relation {
    requires type
    requires direction
    requires semantics
  }

  agreement {
    requires agreement_id
    requires parties
    requires terms
    requires scope
    requires validity
    requires holder
  }

  access {
    definition "fine-grained access allowed between the two nodes"
    requires subject
    requires object
    requires action
    requires condition
    requires scope
    requires decision
  }

  policy_document {
    definition "the policy document governing the relation between the two nodes"
    requires policy_id
    requires version
    requires rules
    requires obligations
    requires constraints
    requires holder
    requires validity
  }

  proof {
    requires evidence
    requires provenance
    requires conformance
  }

  time {
    requires asserted_at
    requires valid_from
    requires valid_to optional
  }

  invariant every_relation_is_tuplet
  invariant every_tuplet_relates_two_nodes
  invariant every_tuplet_has_fine_grained_access
  invariant every_tuplet_has_policy_document
  invariant every_access_decision_is_policy_bound
  invariant no_ambiguous_relation
}
