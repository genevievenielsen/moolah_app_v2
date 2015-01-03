class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :first_name
  devise_parameter_sanitizer.for(:sign_up) << :last_name
  devise_parameter_sanitizer.for(:sign_up) << :grad_year
  devise_parameter_sanitizer.for(:sign_up) << :student
  devise_parameter_sanitizer.for(:sign_up) << :university_id
  devise_parameter_sanitizer.for(:sign_up) << :phone_number
  devise_parameter_sanitizer.for(:sign_up) << :image
  devise_parameter_sanitizer.for(:sign_up) << :email
  devise_parameter_sanitizer.for(:sign_up) << :password
  devise_parameter_sanitizer.for(:sign_up) << :password_confirmation


  devise_parameter_sanitizer.for(:account_update) << :first_name
  devise_parameter_sanitizer.for(:account_update) << :last_name
  devise_parameter_sanitizer.for(:account_update) << :grad_year
  devise_parameter_sanitizer.for(:account_update) << :student
  devise_parameter_sanitizer.for(:account_update) << :university_id
  devise_parameter_sanitizer.for(:account_update) << :phone_number
  devise_parameter_sanitizer.for(:account_update) << :image
  devise_parameter_sanitizer.for(:account_update) << :email
  devise_parameter_sanitizer.for(:account_update) << :password
  devise_parameter_sanitizer.for(:account_update) << :password_confirmation
  devise_parameter_sanitizer.for(:account_update) << :current_password

  end
end
