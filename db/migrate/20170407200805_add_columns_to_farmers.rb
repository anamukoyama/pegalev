class AddColumnsToFarmers < ActiveRecord::Migration[5.0]
  def change
    add_column :farmers, :city, :string
    add_column :farmers, :state, :string
    add_column :farmers, :number, :integer
    add_column :farmers, :complement, :string
  end
end
