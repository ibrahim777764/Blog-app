class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @recent_posts = @user.recent_3_posts
  end
end
