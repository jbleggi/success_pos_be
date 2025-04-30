# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { build(:item) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:quantity).only_integer.allow_nil }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
end
