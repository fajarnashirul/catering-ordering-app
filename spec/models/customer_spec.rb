require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'valid with factorybot' do

    expect(customer = FactoryBot.build(:customer)).to be_valid
  end
  it 'should error with invalid email format' do
    customer = FactoryBot.build(:customer, email:"Nasi Uduk")
    customer.valid?
    expect(customer.errors[:email]).to include("is not an email")
  end
end
