class AddAmountToTithe < ActiveRecord::Migration
  def change
    add_column :tithes, :amount, :decimal, precision: 8, scale: 2
  end
end
