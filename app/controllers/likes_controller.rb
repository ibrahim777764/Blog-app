class LikesController < ApplicationController
  def like_params
    params
      .require(:like)
      .permit(:post_id)
      .merge(author: current_user)
  end

  def create
    @like = Like.new(like_params)
    respond_to do |format|
      format.html do
        if @like.save
          redirect_to user_post_path(current_user, @like.post)
        else
          flash.now[:error] = 'Error: Like could not be saved'
          redirect_to user_post_path(current_user)
        end
      end
    end
  end

  helper_method :create
end
