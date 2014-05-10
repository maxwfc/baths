json.array!(@users) do |user|
  json.extract! user, :id, :name, :bio, :twitter, :email, :password
  json.url user_url(user, format: :json)
end
