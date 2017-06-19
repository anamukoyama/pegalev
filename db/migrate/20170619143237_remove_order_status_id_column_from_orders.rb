class RemoveOrderStatusIdColumnFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :order_statuses_id, :integer
  end
end
