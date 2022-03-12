class Wallet < ApplicationRecord
  before_create { generate_url_for(:checkout_url) }
  before_create { generate_token(:sender_token) }
  before_create { generate_token(:recipient_token) }

  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64
  end

  def generate_url_for(column)
    self[column] = "https://sisipay.herokuapp.com/checkouts/#{SecureRandom.urlsafe_base64}"
  end
end
