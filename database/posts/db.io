// Service posts

// Replication:
// - master-slave (one sync + async)
// - replication factor 3
//
// Sharding:
// - key based by user_id

Table posts {
  post_id uuid [primary key]
  user_id uuid [not null]
  username string [not null]
  description string
  is_deleted bool [not null, default: false]
  image_url string [not null] // S3 link
  lat decimal(9,6) [not null]
  lon decimal(9,6) [not null]
  location_name string [not null]
  updated_at timestamp
  created_at timestamp [default: now()]
}

Table posts_aggregates {
  post_id uuid [primary key]
  total_likes integer [default: 0]
  total_comments integer [default: 0]
  updated_at timestamp
  created_at timestamp [default: now()]
}

Ref posts_aggregates_posts: posts_aggreagates.post_id > posts.post_id