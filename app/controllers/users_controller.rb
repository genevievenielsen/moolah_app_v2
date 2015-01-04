class UsersController < ApplicationController

  def home
    @clubs = current_user.university.clubs
    @items = current_user.university.items
    @users = current_user.university.users
  end

end
