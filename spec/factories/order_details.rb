FactoryBot.define do
  factory :order_detail do
    menu_id { 1 }
    cart_id { 1 }
    customer_order_id { 1 }
    quantity { 1 }
  end
end
