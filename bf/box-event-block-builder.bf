// box-event-block-builder.bf
// Box is the smallest unit of event stream, and box builds blocks.

construction_model box_event_block_builder.v1 {
  definition "box is the smallest unit of event stream; buildpack tool plus box building block creates blocks for storage, data nodes, and memory nodes"

  primitive box.v1

  event_stream_unit {
    is box.v1
    requires box_id
    requires event_id
    requires index
    requires time_boundary
    requires agreement
    requires policy
    requires provenance
  }

  builder_equation {
    buildpack_tool plus box.v1 equals block
  }

  block {
    built_from box.v1
    built_by buildpack_tool optional
    requires identity
    requires index
    requires stream_interface
    requires storage optional
    requires memory optional
    requires processor optional
    requires state
  }

  block_storage {
    composed_of block
    addressed_by index
    moves_by event_stream_unit
  }

  data_node {
    built_from block
    purpose data_accessibility
    requires identity
    requires accessibility
    requires schema
  }

  memory_node {
    built_from block
    purpose reactive_state_memory
    requires memory
    requires state
    requires time_boundary
  }

  invariant box_is_smallest_event_stream_unit
  invariant event_stream_moves_in_box_units
  invariant box_builds_block
  invariant buildpack_tool_can_build_block_from_box
  invariant block_can_be_storage_data_or_memory_node
}
