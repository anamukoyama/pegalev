class AddNameToFarmers < ActiveRecord::Migration[5.0]
  def change
    add_column :farmers, :name, :string
    add_column :farmers, :mobile, :string
    add_column :farmers, :address, :string
    add_column :farmers, :zipcode, :string
  end
end
