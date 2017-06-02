class CreateDeliveryTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_times do |t|
      t.string :time
    end
  end
end
