// schemaful-index-fill.bf
// FabricDB converts schemaless graph material into schemaful fabric by filling positions with indexes.

fabric_db schemaful_index_fill.v1 {
  definition "FabricDB converts schemaless multimodal graph data into schemaful fabric by filling every ambiguous position with an indexable box"

  input schemaless_multimodal_graph required
  output schemaful_indexed_fabric required

  rule schemaless_position_must_be_filled
  rule every_filled_position_gets_index
  rule every_index_points_to_box
  rule every_box_has_identity
  rule every_box_has_accessibility
  rule every_box_has_schema
  rule every_box_has_state
  rule every_box_has_provenance
  rule no_unindexed_position
  rule no_ambiguous_accessibility

  index_fill {
    when missing_identity create identity_index
    when missing_accessibility create access_index
    when missing_schema create schema_index
    when missing_state create state_index
    when missing_relation create relation_index
    when missing_modality create modality_index
    when missing_provenance create provenance_index
  }

  index_record {
    requires index_id
    requires box_id
    requires node_id
    requires schema_ref
    requires address
    requires modality
    requires state_ref
    requires provenance_ref
    requires timestamp
  }

  invariant schemaless_becomes_schemaful_by_index_fill
  invariant every_position_is_indexed
  invariant every_index_resolves_to_box
  invariant every_box_is_directly_accessible_by_index
  invariant every_schemaful_position_preserves_provenance
}
