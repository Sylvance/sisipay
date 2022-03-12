# User model class
class User < ApplicationRecord
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    loop do
      break if User.exists?(column => self[column])

      self[column] = SecureRandom.urlsafe_base64
    end
  end

  def to_s
    email
  end
end
