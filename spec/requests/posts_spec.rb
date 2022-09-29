require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/1/posts' }

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end
    it 'it renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  describe 'GET #show' do
    before(:example) { get '/users/1/posts/1' }

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end
    it 'it renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Here is a specific post for a given user')
    end
  end
end
