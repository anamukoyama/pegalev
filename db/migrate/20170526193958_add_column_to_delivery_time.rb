class AddColumnToDeliveryTime < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_time, :time
  end
end
