class AddRefToSellerDeliveryTimes < ActiveRecord::Migration[5.0]
  def change
   add_reference :seller_delivery_times, :seller, foreign_key: true
   add_reference :seller_delivery_times, :delivery_times, foreign_key: true
  end
end
