// Service subscriptions

// Replication:
// - master-slave (one sync + async)
// - replication factor 3
//
// Sharding:
// - key based by following_user_id

Table follows {
  follow_id uuid [primary key]
  following_user_id uuid [not null]
  followed_user_id uuid [not null]
  created_at timestamp [default: now()]
}
