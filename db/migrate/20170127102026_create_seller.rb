class CreateSeller < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.references :user, foreign_key: true
      t.string     :name
      t.string     :mobile
      t.string     :address
      t.string     :zipcode
      t.string     :city
      t.string     :state
      t.integer    :number
      t.string     :complement
      t.boolean    :delivery, default: false
      t.text       :delivery_times
      t.timestamps
    end
  end
end
