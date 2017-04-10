class RenameForeignKeys < ActiveRecord::Migration[5.0]
  def change
    rename_column :seller_products, :farmer_id, :seller_id
    rename_column :stalls, :farmer_id, :seller_id
  end
end
