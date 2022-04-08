require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  describe 'index' do
    before :each do
      visit user_session_path
      @user = User.create(name: 'Roland', email: 'roland@gmail.com', password: '123456',
                          password_confirmation: '123456')
      within('form') do
        fill_in 'Email', with: 'roland@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'expect page after sign in to be categories path' do
      expect(page).to have_current_path root_path
    end

    it 'categories page shows the right content' do
      expect(page).to have_content('Categories')
      expect(page).to have_content('Sign out')
      expect(page).to have_link('New category')
    end

    it 'page path to be add category path' do
      click_link 'New category'
      expect(page).to have_current_path new_category_path
    end
  end
end
