json.array!(@clauses) do |clause|
  json.extract! clause, :id, :dispute_id, :clause_text, :clause_status
  json.url clause_url(clause, format: :json)
end
