# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6) }
    role { %w[student staff].sample }

    trait :student do
      role { 'student' }
      password { nil }  # Students don't need a password
    end

    trait :staff do
      role { 'staff' }
      password { 'password123' }  # Staff always need a password
    end
  end
end
