json.extract! payment, :id, :total, :references, :created_at, :updated_at
json.url payment_url(payment, format: :json)
