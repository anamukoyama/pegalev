class CreateAdmin < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :avatar
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
