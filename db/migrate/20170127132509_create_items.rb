class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string    :name
      t.decimal   :price
      t.string    :category
      t.string    :image
      t.datetime  :best_before

      t.timestamps
    end
  end
end
