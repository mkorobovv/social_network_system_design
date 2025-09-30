Table users {
  user_id uuid [primary key]
  username string [not null, unique]
  email string [not null, unique]
  created_at timestamp
}

Table users_aggregates {
  user_id uuid [primary key]
  total_posts integer
  total_follows integer
  total_followers integer
}

Ref users_aggregates_users: users_aggregates.user_id > users.user_id

Table follows {
  following_user_id uuid [not null]
  followed_user_id uuid [not null]
  created_at timestamp
}

Ref: users.user_id < follows.following_user_id
Ref: users.user_id < follows.followed_user_id

Table posts {
  post_id uuid [primary key]
  user_id uuid [not null]
  description string
  is_deleted bool [not null, default: false]
  image_url string [not null] // S3 link
  lat decimal(9,6) [not null]
  lon decimal(9,6) [not null]
  location_name string [not null]
  updated_at timestamp
  created_at timestamp
}

Table posts_aggreagates {
  post_id uuid [primary key]
  total_likes integer
  total_comments integer
  created_at timestamp
}

Ref posts_aggregates_posts: posts_aggreagates.post_id > posts.post_id

Ref user_posts: posts.user_id > users.user_id

Table comments {
  comment_id uuid [primary key]
  post_id uuid [not null]
  user_id uuid [not null]
  content string [not null]
  updated_at timestamp
  created_at timestamp
}

Ref user_comments: comments.user_id > users.user_id
Ref post_comments: comments.post_id > posts.post_id

Table likes {
  like_id uuid [primary key]
  user_id uuid [not null]
  post_id uuid [not null]
  created_at timestamp
}

Ref user_likes: likes.user_id > users.user_id
Ref post_likes: likes.post_id > posts.post_id