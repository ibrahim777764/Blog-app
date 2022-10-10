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
      it 'When I click on a post, it redirects me to that post\'s show page' do
        click_link @first_post.title
        expect(page).to have_current_path user_post_path(@first_user, @first_post)
      end
      it 'shows how many comments it has' do
        expect(@first_post.comments_counter).to eq(4)
      end
      it 'shows how many likes it has' do
        expect(@first_post.likes_counter).to eq(0)
      end
      it 'showd the username of each commentor' do
        expect(page).to have_content @first_comment.user.name
        expect(page).to have_content @second_comment.user.name
        expect(page).to have_content @third_comment.user.name
        expect(page).to have_content @fourth_comment.user.name
      end
      it 'shows the comment each commentor left' do
        expect(page).to have_content @first_comment.text
        expect(page).to have_content @second_comment.text
        expect(page).to have_content @third_comment.text
        expect(page).to have_content @fourth_comment.text
      end
    end
  end
end
