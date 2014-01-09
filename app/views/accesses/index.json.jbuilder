json.array!(@accesses) do |access|
  json.extract! access, :id, :meditation_id, :mystic_id
  json.url access_url(access, format: :json)
end
