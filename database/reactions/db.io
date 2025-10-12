// Service reactions

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
