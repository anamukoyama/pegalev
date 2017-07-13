class CreateCustomer < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.string     :name
      t.string     :mobile
      t.string     :address
      t.string     :zipcode
      t.string     :city
      t.string     :state
      t.integer    :number
      t.string     :complement
      t.timestamps
    end
  end
end
