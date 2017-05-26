class AddDeliveryToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :delivery, :boolean
  end
end
