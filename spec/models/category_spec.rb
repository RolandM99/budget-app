require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    @user = User.new(name: 'Roland', email: 'roland@gmail.com')
    @category = Category.new(name: 'Basketball', icon: 'asssets/budgetbulga.png', user: @user)
  end

  before { subject.save }

  it 'Categoy Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'The category Should be associated to a user' do
    expect(subject).to respond_to(:user)
  end
end
