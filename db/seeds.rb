require 'factory_bot_rails'
require 'faker'

# Create staff users
4.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password123",
    role: "staff"
  )
end

# Create Items
10.times do
  FactoryBot.create(:item)
end

# Create Transactions
5.times do
  FactoryBot.create(:transaction)
end

# Create TransactionItems
Transaction.all.each do |transaction|
  item_ids = Item.pluck(:id)
  3.times do
    FactoryBot.create(:transaction_item, transaction_id: transaction.id, item_id: item_ids.sample)
  end
end

# Create Monthly Reports
User.where(role: 'staff').each do |user|
  FactoryBot.create(:monthly_report)
end

puts "Seed data created successfully!"
