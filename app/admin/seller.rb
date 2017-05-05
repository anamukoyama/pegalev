ActiveAdmin.register Seller do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :name, :mobile, :zipcode, :city, :state, :number, :complement, :admin


index do
  selectable_column
  column :id
  column :name
  column :email
  column :sign_in_count
  actions
end

  form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :email
      f.input :password
      f.input :mobile
      f.input :city
      f.input :state
      f.input :number
      f.input :complement
    end
    f.actions
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
