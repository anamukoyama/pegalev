class AddRemoveColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :best_before, :string
    remove_column :products, :organic, :boolean
  end
end
