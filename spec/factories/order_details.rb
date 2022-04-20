FactoryBot.define do
  factory :order_detail do
    customer_order_id { 1 }
    menu_id { 1 }
    quantity { 1 }
  end
end
