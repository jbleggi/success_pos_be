class Item < ApplicationRecord
  has_many :transaction_items
  has_many :items, through: :transaction_items

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, numericality: { only_integer: true }, allow_nil: true
end
