FactoryBot.define do
  factory :order_detail do
    cutomer_order { 1 }
    menu { 1 }
    quantity { 1 }
  end
end
