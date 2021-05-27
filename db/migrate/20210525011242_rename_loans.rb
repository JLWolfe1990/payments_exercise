class RenameLoans < ActiveRecord::Migration[5.2]
  def change
    rename_table(:loans, :transactions)
  end
end
