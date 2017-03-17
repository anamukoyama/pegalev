class ChangeColumnToFarmerProducts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :farmer_products, :stall, index: true
    add_reference :farmer_products, :farmer, index: true
  end
end
