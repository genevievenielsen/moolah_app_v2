class VenmoWorker
  include Sidekiq::Worker


  def perform(user_id)
  	user = User.find_by(:id => user_id)
  	user.venmo_auth_token = nil
    user.venmo_access_token = nil
    user.save
  end

end