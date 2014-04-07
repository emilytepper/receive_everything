json.array!(@comments) do |comment|
  json.extract! comment, :id, :mystic_id, :subject, :text, :is_reply_to, :hidden
  json.url comment_url(comment, format: :json)
end
