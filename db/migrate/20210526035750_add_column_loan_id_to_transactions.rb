class AddColumnLoanIdToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :loan, foreign_key: true
  end
end
