json.array!(@users) do |user|
  json.partial! 'users/user', user: user
  json.url user_url(user, format: :json)
end
