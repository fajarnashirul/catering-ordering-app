FactoryBot.define do
  factory :user do
    name { "Budi" }
    address { "Bandung" }
    phone { "087789057647" }
    email { "budi@gmail.com" }
    password { "budiganteng" }
    role { "user" }
  end
end
