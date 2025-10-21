// Service reactions

// Replication:
// - master-slave (one sync + async)
// - replication factor 3
//
// Sharding:
// - key based by post_id

Table likes {
  like_id uuid [primary key]
  user_id uuid [not null]
  username string [not null]
  post_id uuid [not null]
  created_at timestamp [default: now()]
}

Table comments {
  comment_id uuid [primary key]
  post_id uuid [not null]
  user_id uuid [not null]
  username string [not null]
  content string [not null]
  updated_at timestamp
  created_at timestamp [default: now()]
}
