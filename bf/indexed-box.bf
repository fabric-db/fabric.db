// indexed-box.bf
// A box is indexed.

indexed_box indexed_box.v1 {
  definition "a box is indexed so it can be directly addressed without ambiguity"

  applies_to box.v1

  index {
    requires index_id
    requires box_id
    requires node_id optional
    requires address
    requires schema_ref
    requires state_ref
    requires agreement_refs
    requires link_refs
    requires timestamp
  }

  access {
    by_index required
    by_identity required
    by_address required
  }

  invariant every_box_is_indexed
  invariant every_box_has_direct_addressability
  invariant every_box_index_resolves_without_ambiguity
  invariant no_unindexed_box_in_fabric
}
