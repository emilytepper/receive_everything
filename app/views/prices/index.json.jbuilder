json.array!(@prices) do |price|
  json.extract! price, :id, :product_id, :cents, :start_time, :end_time, :active, :creator_id
  json.url price_url(price, format: :json)
end
