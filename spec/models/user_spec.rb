require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should valid with factoryBot' do
    expect(user = FactoryBot.build(:user)).to be_valid
  end
  it 'give role admin' do
    user = FactoryBot.create(:user, role:'admin')
    expect(user.role).to eq('admin')
  end 
  it 'should invalid with wrong email format' do
    user = FactoryBot.build(:user, email:'hahaemail.com')
    user.valid?
    expect(user.errors[:email]).to include('is not an email')
  end
end
