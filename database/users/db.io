// Service users

Table users {
  user_id uuid [primary key]
  username string [not null, unique]
  email string [not null, unique]
  updated_at timestamp
  created_at timestamp [default: now()]
}

Table users_aggregates {
  user_id uuid [primary key]
  total_follows integer [default: 0]
  total_followers integer [default: 0]
  total_posts integer [default: 0]
  updated_at timestamp
  created_at timestamp [default: now()]
}