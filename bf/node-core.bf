// node-core.bf
// Canonical definition of Node.

node node.v1 {
  definition "a data point with unambiguous identity and unambiguous accessibility"
  role fabric_graph_point

  contains identity required
  contains accessibility required
  contains data required
  contains communication required
  contains state required

  identity {
    definition "the unique, non-ambiguous identity of the node"
    requires node_id
    requires holder
    requires namespace
    requires type
    requires lifecycle
  }

  accessibility {
    definition "the explicit, non-ambiguous way the node can be reached or addressed"
    requires address
    requires protocol
    requires access_scope
    requires agreement
    requires encryption
    requires validity
  }

  data {
    definition "the value represented by the node"
    requires value
    requires schema
    requires provenance
    requires timestamp
  }

  communication {
    receives streams
    emits streams
    requires agreement
    requires encryption
    requires timestamp
  }

  state {
    requires current_value
    requires version
    requires observed_at
  }

  invariant node_has_unambiguous_identity
  invariant node_has_unambiguous_accessibility
  invariant node_is_data_point
  invariant node_can_communicate
  invariant node_receives_streams
  invariant node_emits_streams
  invariant node_does_not_require_touch
}
