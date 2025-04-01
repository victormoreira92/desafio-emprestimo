class ChangeIncomePrecisionAndScale < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :income, :decimal, precision: 15, scale: 2
  end
end
