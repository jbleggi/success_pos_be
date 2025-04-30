# spec/models/monthly_report_spec.rb
require 'rails_helper'

RSpec.describe MonthlyReport, type: :model do
  subject { build(:monthly_report) }

  it { should validate_presence_of(:period_start) }
  it { should validate_presence_of(:period_end) }
  it { should validate_numericality_of(:total_sales).allow_nil }
  it { should validate_numericality_of(:total_items_sold).only_integer.allow_nil }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
end
