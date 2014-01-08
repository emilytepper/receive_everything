json.array!(@products) do |product|
  json.extract! product, :id, :name, :active, :creator_id
  json.url product_url(product, format: :json)
end
