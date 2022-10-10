require 'rails_helper'
RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Amarachi',
      bio: 'Product Manager',
      photo: 'http://product.com',
      posts_counter: 0
    )
    @user2 = User.create(
      name: 'Makkie',
      bio: 'Italian Chef',
      photo: 'http://makkie.com',
      posts_counter: 5
    )
    @post1 = Post.create(
      user: @user1,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'What an amazing time to be alive!')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Welcome micronauts!')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Congrats all, award well deserved.')
    Comment.create(post_id: @post1.id, user_id: @user2.id, text: 'Peace all round.')
    Comment.create(post_id: @post1.id, user_id: @user2.id, text: 'Hello world Favour')
    Like.create(post_id: @post1.id, user_id: @user1.id)
    Like.create(post_id: @post1.id, user_id: @user2.id)
  end
  describe 'A specific post with title, comments and counter' do
    it 'displays the user for post' do
      visit user_post_url(@user1, @post1)
      expect(page).to have_content('Here is a specific post for a given user')
    end
    describe 'a post index page' do
      it 'displays the user name' do
        visit user_posts_path(@user1)
        expect(page).to have_content('Amarachi')
      end
      it 'can see some of the post body' do
        visit user_posts_path(@user1)
        expect(page).to have_content('First post')
        expect(page).to have_content('This is my first post')
      end
    end
  end
end