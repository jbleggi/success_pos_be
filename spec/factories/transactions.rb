FactoryBot.define do
  factory :transaction do
    total_amount { rand(5.0..20.0).round(2) }
    amount_paid { total_amount }
    change_due { (amount_paid - total_amount).abs }
    donation { rand(0.0..2.0).round(2) }
    status { %w[in progress complete canceled].sample }
  end
end
