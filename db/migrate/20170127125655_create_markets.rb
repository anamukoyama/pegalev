class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :district
      t.string :state
      t.integer :number
      t.string :complement

      t.timestamps
    end
  end
end
