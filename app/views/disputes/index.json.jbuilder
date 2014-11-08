json.array!(@disputes) do |dispute|
  json.extract! dispute, :id, :company, :policy_name, :policy_text, :policy_link
  json.url dispute_url(dispute, format: :json)
end
