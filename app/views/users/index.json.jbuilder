json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :company_id, :manager_id, :admin, :role
  json.url user_url(user, format: :json)
end
