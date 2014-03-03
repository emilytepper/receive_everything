json.array!(@goddesses) do |goddess|
  json.extract! goddess, :id, :first_name, :last_name, :email, :personal_statement, :mystic_id
  json.url goddess_url(goddess, format: :json)
end
