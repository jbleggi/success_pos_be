class User < ApplicationRecord
  VALID_ROLES = %w[student staff]

  has_secure_password validations: false

  validates :name, presence: true
  # Conditional validation for email and password based on role
  validates :email, presence: true, uniqueness: true, if: :staff?
  validates :password, presence: true, length: { minimum: 6 }, if: :staff?, on: :create
  validates :role, inclusion: { in: VALID_ROLES }

  # Authenticate user with email and password
  def self.authenticate(email, password)
    user = find_by(email: email, role: "staff")
    return user if user && user.authenticate(password)
    nil
  end

  private

  def staff?
    role == "staff"
  end
end
