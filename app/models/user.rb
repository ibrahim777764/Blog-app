class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_3_posts
    posts.order(updated_at: :desc).limit(3)
  end
end
