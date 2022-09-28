class UsersController < ApplicationController
  def index
  @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @users.show_recent_posts
  end
end