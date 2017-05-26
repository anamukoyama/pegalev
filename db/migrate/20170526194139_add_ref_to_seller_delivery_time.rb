class AddRefToSellerDeliveryTime < ActiveRecord::Migration[5.0]
  def change
    add_reference :seller_delivery_time, :seller, foreign_key: true
    add_reference :seller_delivery_time, :delivery_time, foreign_key: true
  end
end
