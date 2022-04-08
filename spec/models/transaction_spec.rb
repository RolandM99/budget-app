require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    @user = User.new(name: 'Roland', email: 'roland@gmail.com')
    @category = Category.new(name: 'Basketball', icon: 'asssets/budgetbulga.png', user: @user)
    @transaction = Transaction.new(name: 'Computer', amount: 12, category: @category, user: @user)
  end

  before { subject.save }

  it 'Transaction Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'The transaction Should be associated to a user and a category' do
    expect(subject).to respond_to(:user, :category)
  end

  it 'For each transaction, Amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Amount should be an integer value' do
    expect(subject.amount).to be_kind_of Numeric
  end

  it 'Amount should be  greater or equal 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
