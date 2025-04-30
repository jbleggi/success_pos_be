class CreateMonthlyReports < ActiveRecord::Migration[8.0]
  def change
    create_table :monthly_reports do |t|
      t.date :period_start, null: false
      t.date :period_end, null: false
      t.decimal :total_sales
      t.integer :total_items_sold
      t.timestamp :generated_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end
