FactoryBot.define do
  factory :customer_order do
    email { "Budi@email.com" }
    total { 1000.0 }
    status { "New" }
  end
end
