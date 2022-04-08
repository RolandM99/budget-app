require 'rails_helper'

RSpec.feature 'Transactions index page', type: :feature do
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

  it 'should display category name the transaction belongs to' do
    expect(page).to have_content('Basketball')
  end

  it 'should display the transaction amount' do
    expect(page).to have_content('0$')
  end

  it 'page path to be transaction path' do
    expect(page).to have_current_path category_transactions_path(@category.id)
  end
end
