json.array!(@share_links) do |share_link|
  json.extract! share_link, :id, :url, :clicks, :shares, :creatrix_id, :description, :image
  json.url share_link_url(share_link, format: :json)
end
