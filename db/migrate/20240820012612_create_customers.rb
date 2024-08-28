class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.integer :age
      t.string :name
      t.string :cpf
      t.decimal :income
      t.string :location

      t.timestamps
    end
  end
end
