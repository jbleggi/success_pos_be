FactoryBot.define do
  factory :transaction_item do
    association :transaction
    association :item
    quantity { rand(1..3) }
    price_at_sale { item.price }
  end
end
