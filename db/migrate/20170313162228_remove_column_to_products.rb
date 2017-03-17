class RemoveColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :best_before, :string
  end
end
