json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :description, :image, :university_id, :website, :owner_id
  json.url club_url(club, format: :json)
end
