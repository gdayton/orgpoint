json.array!(@companies) do |company|
  json.extract! company, :id, :title
  json.url company_url(company, format: :json)
end
