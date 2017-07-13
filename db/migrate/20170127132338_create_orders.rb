class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer, foregin_key: true
      t.references :stall, foregin_key: true
      t.decimal :subtotal
      t.decimal :shipping
      t.string  :bill_address
      t.string  :number
      t.text    :status
      t.string :ship_address
      t.timestamps
    end
  end
end
