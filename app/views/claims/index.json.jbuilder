json.array!(@claims) do |claim|
  json.extract! claim, :id, :claim_text, :claim_status, :claim_count
  json.url claim_url(claim, format: :json)
end
