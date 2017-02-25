class AddCoordinatesToMarket < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :latitude, :float
    add_column :markets, :longitude, :float
  end
end
