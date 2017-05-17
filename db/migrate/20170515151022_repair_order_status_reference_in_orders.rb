class RepairOrderStatusReferenceInOrders < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :orders, :order_statuses
    add_reference :orders, :order_statuses, index: true
    add_foreign_key :orders, :order_statuses
  end
end
