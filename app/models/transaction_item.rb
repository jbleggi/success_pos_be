class TransactionItem < ApplicationRecord
  belongs_to :transaction
  belongs_to :item

  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :price_at_sale, presence: true, numericality: true
end
