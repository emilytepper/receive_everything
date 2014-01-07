json.array!(@mystics) do |mystic|
  json.extract! mystic, :id
  json.url mystic_url(mystic, format: :json)
end
