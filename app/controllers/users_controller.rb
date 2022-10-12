class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index
    @users = User.all
  end
end
