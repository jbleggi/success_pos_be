# spec/models/transaction_item_spec.rb
require 'rails_helper'

RSpec.describe TransactionItem, type: :model do
  subject { build(:transaction_item) }

  it { should belong_to(:order).class_name("Transaction") }
  it { should belong_to(:item) }

  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).only_integer }
  it { should validate_presence_of(:price_at_sale) }
  it { should validate_numericality_of(:price_at_sale) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
end
