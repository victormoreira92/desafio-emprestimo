class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.integer :type
      t.integer :interest_rate

      t.timestamps
    end
  end
end
