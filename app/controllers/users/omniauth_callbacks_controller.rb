class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def venmo
   @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
   if @user.persisted?
     sign_in_and_redirect @user, :event => :authentication
     set_flash_message(:notice, :success, :kind => "Venmo") if is_navigational_format?
   else
     session["devise.twitter_uid"] = request.env["omniauth.auth"]
     redirect_to new_user_registration_url
   end
  end
end
