json.array!(@photos) do |photo|
  json.extract! photo, :id, :caption, :user_id, :image
  json.url photo_url(photo, format: :json)
end
