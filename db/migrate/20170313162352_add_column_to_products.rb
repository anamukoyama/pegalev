class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :best_before, :integer, default: 1
  end
end
