# spec/models/transaction_spec.rb
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { build(:transaction) }

  it { should validate_inclusion_of(:status).in_array(%w[in progress complete canceled]).allow_nil }
  it { should validate_numericality_of(:total_amount).allow_nil }
  it { should validate_numericality_of(:amount_paid).allow_nil }
  it { should validate_numericality_of(:change_due).allow_nil }
  it { should validate_numericality_of(:donation).allow_nil }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
end
