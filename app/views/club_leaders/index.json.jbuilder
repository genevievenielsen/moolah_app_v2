json.array!(@club_leaders) do |club_leader|
  json.extract! club_leader, :id, :first_name, :last_name, :title
  json.url club_leader_url(club_leader, format: :json)
end
