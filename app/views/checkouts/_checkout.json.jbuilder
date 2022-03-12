json.extract! checkout, :id, :amount, :sender_token, :recipient_token, :identity, :redirect_uri, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
