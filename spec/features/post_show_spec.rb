# require 'rails_helper'

# RSpec.describe 'Post index page', type: :system do
#   describe 'GET /postss/index' do
#     before(:each) do
#       @user1 = User.create(name: 'John',
#                            photo: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80',
#                            bio: 'John is a great person.', posts_counter: 0)
#       @post1 = Post.create(user: @user1, title: 'Post 1', text: 'This is the first post.', user_id: @user1.id)
#       @post2 = Post.create(user: @user1, title: 'Post 2', text: 'This is the second post.', user_id: @user1.id)
#       @post3 = Post.create(user: @user1, title: 'Post 3', text: 'This is the third post.', user_id: @user1.id)
#       @post4 = Post.create(user: @user1, title: 'Post 4', text: 'This is the fourth post.', user_id: @user1.id)

#       @comment1 = Comment.create(text: 'This is the first comment.', user_id: @user1.id, post_id: @post1.id)
#       @comment2 = Comment.create(text: 'This is the second comment.', user_id: @user1.id, post_id: @post1.id)
#       @comment3 = Comment.create(text: 'This is the third comment.', user_id: @user1.id, post_id: @post1.id)

#       @post1.save
#       @post2.save
#       @user1.save

#       @comment1.save
#       @comment2.save
#       @comment3.save
#     end

#     feature 'User index page' do
#       background do
#         @user1 = User.find_by(name: 'John')
#         visit user_post_path(@user1, @post1)
#       end

#       it 'displays a post\'s Title' do
#         expect(page).to have_content('Post 1')
#       end

#       it 'displays a post\'s author' do
#         expect(page).to have_content('John')
#       end

#       it 'displays a post\'s body' do
#         expect(page).to have_content('This is the first post.')
#       end

#       it 'displays how many comments the post has' do
#         expect(page).to have_content('Comments: 3')
#       end

#       it 'displays how many likes the post has' do
#         expect(page).to have_content('Likes: 0')
#       end

#       it 'displays the user name of each comment' do
#         expect(page).to have_content('John')
#       end

#       it 'displays the comment text' do
#         expect(page).to have_content('This is the first comment.')
#       end
#     end
#   end
# end

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
