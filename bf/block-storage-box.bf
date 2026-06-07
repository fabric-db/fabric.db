// block-storage-box.bf
// Block storage is built from boxes.

storage_model block_storage_box.v1 {
  definition "block storage is built by composing boxes into indexed data blocks"
  meaning "a block is a box-shaped storage unit: locked, indexed, stream-only, encrypted, and addressable"

  block {
    definition "a uniform indexed box used as a storage block"
    is box.v1
    requires block_id
    requires index
    requires size
    requires state
    requires checksum
    requires encryption
    requires provenance
  }

  block_storage {
    definition "a storage fabric composed from block boxes"
    composed_of block
    addressed_by index
    moved_by encrypted_stream
    governed_by agreement
  }

  builder {
    definition "any conformant implementer can build blocks using boxes"
    requires box_contract
    requires index_contract
    requires stream_contract
    requires encryption_contract
    requires conformance
  }

  invariant block_is_box
  invariant storage_is_composition_of_boxes
  invariant every_block_is_indexed
  invariant every_block_is_encrypted
  invariant every_block_moves_by_stream
  invariant any_conformant_actor_can_build_blocks_using_boxes
  invariant no_vendor_owns_block_shape
}
