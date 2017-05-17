class QuantityFromStringToDecimal < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_items, :quantity, :string
    add_column :order_items, :quantity, :integer
  end
end
