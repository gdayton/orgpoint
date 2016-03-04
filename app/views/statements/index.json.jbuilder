json.array!(@statements) do |statement|
  json.extract! statement, :id, :company_id, :amount
  json.url statement_url(statement, format: :json)
end
