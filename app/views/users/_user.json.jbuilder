json.extract! user, :id, :name, :email, :password_digest, :auth_token, :created_at, :updated_at
json.url user_url(user, format: :json)
