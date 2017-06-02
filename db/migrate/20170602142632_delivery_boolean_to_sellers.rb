class DeliveryBooleanToSellers < ActiveRecord::Migration[5.0]
  def change
    remove_column :sellers, :delivery, :boolean
    add_column :sellers, :delivery, :boolean, default: false
  end
end
