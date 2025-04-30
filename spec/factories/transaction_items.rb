FactoryBot.define do
  factory :transaction_item do
    association :order, factory: :transaction
    association :item
    quantity { rand(1..3) }
    price_at_sale { item.price }
  end
end
