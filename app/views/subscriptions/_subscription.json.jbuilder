json.extract! subscription, :id, :name, :date, :price, :validity, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
