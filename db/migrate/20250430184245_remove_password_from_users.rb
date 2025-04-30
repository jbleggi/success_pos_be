class RemovePasswordFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_index :users, :password if index_exists?(:users, :password)
    remove_column :users, :password, :text
  end
end
