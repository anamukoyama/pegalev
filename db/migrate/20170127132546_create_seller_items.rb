class CreateSellerItems < ActiveRecord::Migration[5.0]
  def change
    create_table :seller_items do |t|
      t.references :seller, foreign_key: true
      t.references :item, foreign_key: true
      t.string :unity_type, :string
      t.string :box, :string
      t.boolean :organic, :boolean
      t.decimal :price, :decimal
      t.timestamps
    end
  end
end
