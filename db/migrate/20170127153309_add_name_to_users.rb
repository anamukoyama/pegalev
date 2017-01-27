class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :address, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :number, :integer
    add_column :users, :complement, :string
  end
end
