class AddColumnsToStallProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :stall_products, :unity_type, :string
    add_column :stall_products, :box, :string
    add_column :stall_products, :organic, :boolean
    add_column :stall_products, :price, :decimal
  end
end
