-- fabric.db permissions model

DEFINE ACCESS actor_access ON DATABASE TYPE RECORD
  SIGNUP ( CREATE actor CONTENT {
    name: $name,
    type: $type
  } )
  SIGNIN ( SELECT * FROM actor WHERE id = $id );

-- Placeholder policy-bound access rules.
