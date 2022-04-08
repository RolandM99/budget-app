require 'rails_helper'

RSpec.feature 'Transactions new page', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create(name: 'Roland', email: 'roland@gmail.com', password: '123456', password_confirmation: '123456')
    @category = Category.create(name: 'Basketball', icon: 'assets/budgetbulga.png', user: @user)
    @transaction = Transaction.new(name: 'Computer', amount: 23, category: @category, user: @user)
    within('form') do
      fill_in 'Email', with: 'roland@gmail.com'
      fill_in 'Password', with: '123456'
    end

    click_button 'Log in'
    visit category_transactions_path(@category.id)
  end

  it 'should find the right content' do
    expect(page).to have_content('New transaction')
  end
end
