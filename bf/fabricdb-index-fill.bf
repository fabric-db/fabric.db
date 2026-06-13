// fabricdb-index-fill.bf
// fabric.db fills incomplete multimodal graph positions with boxes.

fabric_db fabricdb_index_fill.v1 {
  definition "fabric.db takes an incomplete multimodal graph database and fills missing graph positions with boxes so every position is directly accessible by index"

  input incomplete_multimodal_graph required
  output indexed_box_fabric required

  rule incomplete_position_becomes_box
  rule every_position_gets_identity
  rule every_position_gets_accessibility
  rule every_position_gets_index
  rule every_position_gets_state
  rule every_position_gets_links
  rule every_position_gets_agreements_when_needed
  rule no_ambiguous_position
  rule no_unindexed_position
  rule no_orphan_position

  index {
    requires position_id
    requires box_id
    requires node_id
    requires modality
    requires address
    requires schema
    requires state_ref
    requires link_refs
    requires timestamp
  }

  multimodal_position {
    modality text optional
    modality image optional
    modality audio optional
    modality video optional
    modality file optional
    modality event optional
    modality sensor optional
    modality structured_data optional
    modality real_world_referent optional
  }

  fill {
    when missing_identity create box_identity
    when missing_accessibility create indexed_address
    when missing_state create state_record
    when missing_relation create typed_link
    when missing_context create agreement_or_branch
    when missing_modality create modality_marker
  }

  access {
    by_index required
    by_identity required
    by_link optional
    by_stream optional
  }

  invariant fabricdb_fills_incomplete_graph_with_boxes
  invariant every_position_is_indexed
  invariant every_position_is_directly_accessible
  invariant every_position_has_unambiguous_identity
  invariant every_position_has_unambiguous_accessibility
  invariant every_filled_position_preserves_provenance
}
