class AddFieldToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :orderitems, :unit_price, :decimal
  end
end
