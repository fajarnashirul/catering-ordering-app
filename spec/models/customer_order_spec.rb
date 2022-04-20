require 'rails_helper'

RSpec.describe CustomerOrder, type: :model do
  it 'should valid with factoryBot' do
    expect(order1 = FactoryBot.build(:customer_order)).to be_valid
  end
  it 'invalid with non numerical total' do
    order1 = FactoryBot.build(:customer_order, total:"huba")
   order1.valid? 
  expect(order1.errors[:total]).to include("is not a number")
  end
  it 'should valid with email format' do
    customer = FactoryBot.build(:customer)
    expect(order1 = FactoryBot.build(:customer_order, email: customer.email)).to be_valid
  end
end
