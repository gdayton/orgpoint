json.array!(@departments) do |department|
  json.extract! department, :id, :title, :company_id
  json.url department_url(department, format: :json)
end
