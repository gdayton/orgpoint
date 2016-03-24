json.array!(@activities) do |activity|
  json.extract! activity, :id, :user_id, :content
  json.url activity_url(activity, format: :json)
end
