# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_30_184245) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.text "icon_url"
    t.boolean "is_active", default: true
    t.integer "quantity"
    t.datetime "created_at", precision: nil
  end

  create_table "monthly_reports", force: :cascade do |t|
    t.date "period_start", null: false
    t.date "period_end", null: false
    t.decimal "total_sales"
    t.integer "total_items_sold"
    t.datetime "generated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_items", force: :cascade do |t|
    t.bigint "transaction_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity", null: false
    t.decimal "price_at_sale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_transaction_items_on_item_id"
    t.index ["transaction_id"], name: "index_transaction_items_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.decimal "total_amount"
    t.decimal "amount_paid"
    t.decimal "change_due"
    t.decimal "donation"
    t.string "status", comment: "in progress, complete, canceled"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "role", comment: "staff or student"
    t.datetime "created_at", precision: nil
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "transaction_items", "items"
  add_foreign_key "transaction_items", "transactions"
end
