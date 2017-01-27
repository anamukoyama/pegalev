class CreateStallProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :stall_products do |t|
      t.references :stall, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
