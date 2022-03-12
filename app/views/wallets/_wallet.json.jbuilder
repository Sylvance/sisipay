json.extract! wallet, :id, :amount, :sender_token, :recipient_token, :checkout_url, :provider, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
