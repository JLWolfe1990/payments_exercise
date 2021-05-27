class AddTransactedOnToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transacted_on, :date, null: false
  end
end
