// Service subscriptions

Table follows {
  follow_id uuid [primary key]
  following_user_id uuid [not null]
  followed_user_id uuid [not null]
  created_at timestamp [default: now()]
}
