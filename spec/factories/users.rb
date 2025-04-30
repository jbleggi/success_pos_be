# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { SecureRandom.hex(10) }
    role { %w[student staff].sample }
  end
end
