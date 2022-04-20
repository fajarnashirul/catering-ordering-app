require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  it 'should give the result of menu atribut' do
    order_detail1 = FactoryBot.create(:order_detail, menu_id: 1)
    menu1 = FactoryBot.create(:menu)
    menu2 = FactoryBot.create(:menu, name:"Cireng")
    
    expect(Menu.by_params(order_detail1.menu_id)).to eq([menu1])
  end
  it 'should give total from quantity and price' do
    menu1 = FactoryBot.create(:menu, name:"nasi uduk", price: 15000.0)
    menu2 = FactoryBot.create(:menu, name: "Pop Ice", price: 5000.0)
    customer1 = FactoryBot.create(:customer, name:"haha", email:"haha13@gmail.com")
    customer2 = FactoryBot.create(:customer, name:"hihi", email:"hihi13@gmail.com")
    order1 = FactoryBot.create(:customer_order, email:customer1.email, total: 20000.0)
    order_detail1 = FactoryBot.create(:order_detail, menu_id: menu1.id)
    order_detail2 = FactoryBot.create(:order_detail, menu_id: menu2.id)
    expect(OrderDetail.total_price)
  end
end
