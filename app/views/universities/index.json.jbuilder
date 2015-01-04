json.array!(@universities) do |university|
  json.extract! university, :id, :name, :location, :owner_id, :image
  json.url university_url(university, format: :json)
end
