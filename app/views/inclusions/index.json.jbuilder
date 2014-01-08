json.array!(@inclusions) do |inclusion|
  json.extract! inclusion, :id, :product_id, :meditation_id, :creator_id
  json.url inclusion_url(inclusion, format: :json)
end
