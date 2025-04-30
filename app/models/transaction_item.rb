class TransactionItem < ApplicationRecord
belongs_to :order, class_name: Transaction, foreign_key: transaction_id
  belongs_to :item

  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :price_at_sale, presence: true, numericality: true
end
