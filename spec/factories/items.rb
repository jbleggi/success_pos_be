FactoryBot.define do
  factory :item do
    name { Faker::Coffee.blend_name }
    price { rand(1.5..6.0).round(2) }
    icon_url { Faker::Internet.url }
    is_active { true }
    quantity { rand(1..50) }
  end
end
