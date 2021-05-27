class AddTypeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :type, :string
    add_index :transactions, :type
  end
end
