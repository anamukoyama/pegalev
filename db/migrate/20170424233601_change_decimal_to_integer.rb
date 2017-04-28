class ChangeDecimalToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :seller_products, :price, :float
  end
end
