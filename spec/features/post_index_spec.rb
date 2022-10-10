require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Amarachi',
      bio: 'Product Manager',
      photo: 'http://product.com',
      posts_counter: 0
    )

    @post1 = Post.create(
      user: @user1,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      user: @user1,
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Hi everytone, nice to meet you!')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Hello loves, welcome!!')
    Comment.create(post_id: @post2.id, user_id: @user1.id, text: 'How are you?, been a while')

    Like.create(post_id: @post1.id, user_id: @user1.id)
    Like.create(post_id: @post2.id, user_id: @user1.id)
  end

  describe 'a post index page' do
    it 'displays the user name' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Amarachi')
    end

    it 'displays the user photo' do
      visit user_posts_path(@user1)
      expect(page).to have_css("img[src*='http://product.com']")
    end

    it 'can see some of the post body' do
      visit user_posts_path(@user1)
      expect(page).to have_content('First post')
      expect(page).to have_content('Second post')
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
    end

    it 'shows how many comments and likes a post has' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Comments: 2, Likes: 1')
      expect(page).to have_content('Comments: 1, Likes: 1')
    end

    it 'shows comments in a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Hi everytone, nice to meet you!')
      expect(page).to have_content('Hello loves, welcome!!')
    end

    it 'it redirects me to a posts show page when the post is clicked' do
      visit user_posts_path(@user1)
      click_link 'First post'
      expect(page).to have_current_path(user_post_path(@user1, @post1))
    end

    it 'it me to a posts show page when the post is clicked' do
      visit user_posts_path(@user1)
      click_link 'Second post'
      expect(page).to have_current_path(user_post_path(@user1, @post2))
    end
  end
end
