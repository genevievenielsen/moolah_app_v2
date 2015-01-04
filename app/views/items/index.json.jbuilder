json.array!(@items) do |item|
  json.extract! item, :id, :name, :price, :required, :owner_id, :expiration_date, :club_id, :image, :category, :color, :size, :university_id
  json.url item_url(item, format: :json)
end
