class CreateStalls < ActiveRecord::Migration[5.0]
  def change
    create_table :stalls do |t|
      t.references :farmer, foreign_key: true
      t.references :market, foreign_key: true

      t.timestamps
    end
  end
end
