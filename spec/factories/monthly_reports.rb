FactoryBot.define do
  factory :monthly_report do
    period_start { Date.today.beginning_of_month }
    period_end { Date.today.end_of_month }
    total_sales { rand(100.0..1000.0).round(2) }
    total_items_sold { rand(50..300) }
  end
end
