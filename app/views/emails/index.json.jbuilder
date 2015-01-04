json.array!(@emails) do |email|
  json.extract! email, :id, :first_name, :last_name, :email, :club_id
  json.url email_url(email, format: :json)
end
