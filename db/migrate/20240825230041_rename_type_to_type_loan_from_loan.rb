class RenameTypeToTypeLoanFromLoan < ActiveRecord::Migration[7.0]
  def change
    rename_column :loans, :type, :type_loan
  end
end
