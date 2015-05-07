class UsersController < ApplicationController

  def home
    @university = current_user.university
    @clubs = current_user.university.clubs
    @items = current_user.university.items
    @users = current_user.university.users
    @cart = Cart.find_or_create_by(:user_id => current_user.id, :paid => false)

  end

end
