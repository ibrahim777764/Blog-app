class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    user = current_user
    @post.user = user

    render :new unless @post.save

    redirect_to user_posts_path(user, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
