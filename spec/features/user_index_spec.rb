require 'rails_helper'
RSpec.describe 'Users index', type: :feature do
  before(:each) do
    # rubocop: disable Layout/LineLength
    @first_user = User.create(name: 'Tom',
                              photo: 'https://www.thoughtco.com/thmb/0I-Uw-0rcc6MUzcZJauNGKR9JzA=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/male-computer-programmer-using-laptop-at-desk-in-office-755650739-5c5bb32346e0fb0001f24d3d.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
    @second_user = User.create(name: 'Lilly',
                               photo: 'https://image.benq.com/is/image/benqco/monitor-for-programmer-1?$ResponsivePreset$&wid=1468', bio: 'Teacher from Poland.', posts_counter: 0)
    @third_user = User.create(name: 'Mustapha',
                              photo: 'https://www.mooc.org/hs-fs/hubfs/learn-programming-career-jpg.jpeg?width=500&name=learn-programming-career-jpg.jpeg', bio: 'Teacher from Algeria.', posts_counter: 0)
    # rubocop: enable Layout/LineLength
    visit users_path
  end
  describe 'user index page' do
    it 'shows the usernames of all users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Mustapha')
    end
    it 'The images links are not broken' do
      page.all('#img').each do |img|
        visit img[:src]
        page.status_code.should be 200
      end
    end
    it 'shows the profile picture for each user' do
      expect(page).to have_xpath("//img[contains(@src,'https://www.thoughtco.com/thmb/0I-Uw-0rcc6MUzcZJauNGKR9JzA=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/male-computer-programmer-using-laptop-at-desk-in-office-755650739-5c5bb32346e0fb0001f24d3d.jpg')]")
      expect(page).to have_xpath("//img[contains(@src,'https://image.benq.com/is/image/benqco/monitor-for-programmer-1?$ResponsivePreset$&wid=1468')]")
      expect(page).to have_xpath("//img[contains(@src,'https://www.mooc.org/hs-fs/hubfs/learn-programming-career-jpg.jpeg?width=500&name=learn-programming-career-jpg.jpeg')]")
    end
    it 'shows the number of posts each user has written' do
      expect(page).to have_content('0')
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'Tom'
      expect(page).to have_current_path user_path(@first_user)
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'Lilly'
      expect(page).to have_current_path user_path(@second_user)
    end
  end
end
