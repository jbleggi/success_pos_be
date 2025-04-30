class User < ApplicationRecord
  VALID_ROLES = %w[student staff]

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
  validates :role, inclusion: { in: VALID_ROLES }
end
