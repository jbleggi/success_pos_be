class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.timestamp :created_at
      t.decimal :total_amount
      t.decimal :amount_paid
      t.decimal :change_due
      t.decimal :donation
      t.string :status, comment: 'in progress, complete, canceled'
    end
  end
end
