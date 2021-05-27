class RenameFundedAmountToAmountOnTransactions < ActiveRecord::Migration[5.2]
  def change
    rename_column(:transactions, :funded_amount, :amount)
  end
end
