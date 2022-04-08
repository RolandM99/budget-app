require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create(name: 'Roland', email: 'roland@gmail.com', password: '123456', password_confirmation: '123456')
    within('form') do
      fill_in 'Email', with: 'roland@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    @category = Category.create(name: 'Basketball', icon: 'assets/budgetbulga.png', user: @user)
    visit new_category_path
  end

  it 'should display category form' do
    expect(page).to have_content('Add a new category')
  end
end
