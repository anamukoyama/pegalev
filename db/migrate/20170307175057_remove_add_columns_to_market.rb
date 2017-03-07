class RemoveAddColumnsToMarket < ActiveRecord::Migration[5.0]
  def change
    remove_column :markets, :zipcode
    remove_column :markets, :city
    remove_column :markets, :district
    remove_column :markets, :state
    remove_column :markets, :complement
    add_column :markets, :weekday, :string
    add_column :markets, :inscription, :integer
    add_column :markets, :name, :string
  end
end
