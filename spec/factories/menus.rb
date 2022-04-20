FactoryBot.define do
  factory :menu do
    name { "Nasi kuning" }
    description { " nasi yang berwarna kuning dengan menggunakan pewarna makanan alami yakni kunyit" }
    price { 5000.0 }
    category_id {1}
  end
  
  factory :invalid_menu, parent: :menu do
    name { nil }
    description { nil }
    price {10000.0}
    category_id {1}
  end
end
