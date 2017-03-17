class RenameStallProductsToFarmerProducts < ActiveRecord::Migration[5.0]
  def change
    rename_table :stall_products, :farmer_products
  end
end
