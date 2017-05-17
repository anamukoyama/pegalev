class RemoveAmountFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :amount
  end
end
