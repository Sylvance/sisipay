# User model class
class User < ApplicationRecord
  has_secure_password

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    return if User.exists?(column => self[column])

    self[column] = SecureRandom.urlsafe_base64
  end

  def to_s
    email
  end
end
