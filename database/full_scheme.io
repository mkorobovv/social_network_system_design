// Service users

Table users {
  user_id uuid [primary key]
  username string [not null, unique]
  email string [not null, unique]
  updated_at timestamp
  created_at timestamp [default: 'now()']
}

Table users_aggregates {
  user_id uuid [primary key]
  total_follows integer [default: 0]
  total_followers integer [default: 0]
  total_posts integer [default: 0]
  updated_at timestamp
  created_at timestamp [default: 'now()']
}

Ref users_aggregates_users: users_aggregates.user_id > users.user_id

// Service subscriptions

Table follows {
  follow_id uuid [primary key]
  following_user_id uuid [not null]
  followed_user_id uuid [not null]
  created_at timestamp [default: 'now()']
}

// Service posts

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
  created_at timestamp [default: 'now()']
}

Table posts_aggregates {
  post_id uuid [primary key]
  total_likes integer [default: 0]
  total_comments integer [default: 0]
  updated_at timestamp
  created_at timestamp [default: 'now()']
}

Ref posts_aggregates_posts: posts_aggregates.post_id > posts.post_id


// Service reactions

Table likes {
  like_id uuid [primary key]
  user_id uuid [not null]
  username string [not null]
  post_id uuid [not null]
  created_at timestamp [default: 'now()']
}

Table comments {
  comment_id uuid [primary key]
  post_id uuid [not null]
  user_id uuid [not null]
  username string [not null]
  content string [not null]
  updated_at timestamp
  created_at timestamp [default: 'now()']
}
