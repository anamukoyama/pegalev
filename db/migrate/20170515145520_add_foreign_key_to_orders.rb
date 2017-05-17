class AddForeignKeyToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_status_id, :integer
    add_foreign_key :orders, :order_statuses, column: :order_status_id
  end
end
