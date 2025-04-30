class Transaction < ApplicationRecord
  VALID_STATUSES = %w[in progress complete voided]

  validates :status, inclusion: { in: VALID_STATUSES }, allow_nil: true
  validates :total_amount, :amount_paid, :change_due, :donation, numericality: true, allow_nil: true
end
