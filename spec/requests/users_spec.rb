require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    before(:example) { get '/users' }

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Here is the list of users')
    end
  end
  describe 'GET #show' do
    before(:example) { get '/users/1' }
    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end
    it 'it renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Here is a specific user')
    end
  end
end
