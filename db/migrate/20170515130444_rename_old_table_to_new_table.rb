class RenameOldTableToNewTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :order_items, :orderitems
  end
end
