class AddCustomerToLoans < ActiveRecord::Migration[7.0]
  def change
    add_reference :loans, :customer, null: false, foreign_key: true
  end
end
