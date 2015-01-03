json.array!(@club_admins) do |club_admin|
  json.extract! club_admin, :id, :user_id, :club_id
  json.url club_admin_url(club_admin, format: :json)
end
