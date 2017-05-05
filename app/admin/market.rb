ActiveAdmin.register Market do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :address, :latitude, :longitude, :weekday, :inscription, :name

  index do
    selectable_column
    column :id
    column :inscription
    column :name
    column :address
    column :weekday
    actions
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
