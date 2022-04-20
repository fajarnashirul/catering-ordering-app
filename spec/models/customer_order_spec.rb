require 'rails_helper'

RSpec.describe CustomerOrder, type: :model do
  it 'should valid with factoryBot' do
    expect(order1 = FactoryBot.build(:customer_orders)).to be_valid
  end
end
