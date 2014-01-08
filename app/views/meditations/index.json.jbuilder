json.array!(@meditations) do |meditation|
  json.extract! meditation, :id, :name, :soundcloud_url, :creator_id
  json.url meditation_url(meditation, format: :json)
end
