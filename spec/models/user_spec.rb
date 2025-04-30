# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  context "when the user is staff" do
    before { subject.role = 'staff' }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }

    it "has a valid factory" do
      expect(subject).to be_valid
    end
  end

  context "when the user is a student" do
    before { subject.role = 'student' }

    it { should_not validate_presence_of(:password) }
    it "is valid without a password" do
      subject.password = nil
      expect(subject).to be_valid
    end

    it "has a valid factory" do
      expect(subject).to be_valid
    end
  end
end
