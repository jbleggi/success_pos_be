class MonthlyReport < ApplicationRecord
  validates :period_start, :period_end, presence: true
  validates :total_sales, numericality: true, allow_nil: true
  validates :total_items_sold, numericality: { only_integer: true }, allow_nil: true
end
