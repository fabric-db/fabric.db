// fabricdb-node.bf
// fabric.db database rule: every node is a fabric.

fabric_db fabric_db_node_model.v1 {
  definition "fabric.db is the database where every node is a fabric"

  stores node
  stores box
  stores agreement
  stores state
  stores link
  stores stream

  rule every_node_is_fabric
  rule every_node_has_identity
  rule every_node_has_boundary
  rule every_node_has_state
  rule every_node_has_agreements
  rule every_node_has_links
  rule every_node_receives_streams
  rule every_node_emits_streams
  rule data_moves_by_box
  rule data_stays_by_box
  rule zero_touch
  rule encrypted_always
  rule no_implicit_trust

  invariant fabricdb_is_composition_of_fabric_nodes
  invariant node_is_not_flat_record
  invariant node_preserves_meaning
  invariant node_boundary_is_not_touched
}
