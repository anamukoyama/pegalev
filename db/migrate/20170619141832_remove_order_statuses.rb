class RemoveOrderStatuses < ActiveRecord::Migration[5.0]
  def change
    remove_index :orders, :order_statuses_id
    drop_table :order_statuses
  end
end
