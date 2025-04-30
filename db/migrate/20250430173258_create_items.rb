class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.text :icon_url
      t.boolean :is_active, default: true
      t.integer :quantity
      t.timestamp :created_at
    end
  end
end
