class CreateSellerDeliveryTimes < ActiveRecord::Migration[5.0]
  def change
    create_join_table :sellers, :delivery_times do |t|
      t.index :seller_id
      t.index :delivery_time_id
    end
  end
end
