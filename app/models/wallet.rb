class Wallet < ApplicationRecord
  before_create { generate_url_for(:checkout_url) }
  before_create { generate_token(:sender_token) }
  before_create { generate_token(:recipient_token) }

  def generate_token(column)
    return if User.exists?(column => self[column])

    self[column] = SecureRandom.urlsafe_base64
  end

  def generate_url_for(column)
    return if Wallet.exists?(column => self[column])

    self[column] = "https://sisipay.herokuapp.com/checkouts/#{SecureRandom.urlsafe_base64}"
  end
end
