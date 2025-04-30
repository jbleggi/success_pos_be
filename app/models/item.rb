class Item < ApplicationRecord
  has_many :transaction_items
  has_many :items, through: :transaction_items
end
