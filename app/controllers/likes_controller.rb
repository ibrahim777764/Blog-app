class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = current_user
    liked = Like.where(user:, post:)

    return if liked.present?

    like = Like.create(user:, post:)
    return unless like.save

    redirect_to user_post_path(post.user, post)
  end
end
