class CreateTransactionItems < ActiveRecord::Migration[8.0]
  def change
    create_table :transaction_items do |t|
      t.references :transaction, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :price_at_sale, null: false

      t.timestamps
    end
  end
end
