class AddFieldsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :subtotal, :decimal
    add_column :orders, :total, :decimal
    add_column :orders, :shipping, :decimal
    add_column :orders, :ship_address, :string
    add_column :orders, :bill_address, :string
    add_column :orders, :order_number, :string
  end
end
