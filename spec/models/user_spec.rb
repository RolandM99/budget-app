require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.new(name: 'Roland', email: 'roland@gmail.com')
  end
  before { subject.save }

  it 'Username should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
