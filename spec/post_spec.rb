require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Tests Post model validation ' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')
    subject { Post.new(user: first_user, title: 'Hello', text: 'This is my first post') }
    before { subject.save }

    it 'title should not be empty' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'title length should not be more 250 characters' do
      subject.title = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
             Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
             took a galley of type and scrambled it to make a type specimen book.
              It has survived not only five centuries"
      expect(subject).to_not be_valid
    end

    it 'comments counter should be greater than or equal than 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'comments counter should be an integer' do
      subject.comments_counter = 1.2
      expect(subject).to_not be_valid
    end

    it 'likes counter should be greater than or equal than 0' do
      subject.likes_counter = -3
      expect(subject).to_not be_valid
    end

    it 'likes counter should be an integer' do
      subject.likes_counter = 8.6
      expect(subject).to_not be_valid
    end
  end

  describe 'Tests for Post model methods' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')
    before { 10.times { Comment.create(post_id: subject, user: first_user, text: 'Hola Tom!') } }

    it 'recent five posts should return 5 comments' do
      expect(subject.five_most_recent_comments).to match_array(subject.comments.last(5))
    end
  end
end
