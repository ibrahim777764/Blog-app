class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def recent_5_comments
    comments.order(updated_at: :desc).limit(5)
  end
end
