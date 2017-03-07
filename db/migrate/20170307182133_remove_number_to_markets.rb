class RemoveNumberToMarkets < ActiveRecord::Migration[5.0]
  def change
    remove_column :markets, :number, :integer
  end
end
