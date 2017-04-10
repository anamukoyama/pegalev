class RenameTables < ActiveRecord::Migration[5.0]
  def change
    rename_table :farmer_products, :seller_products
    rename_table :farmers, :sellers
  end
end
