ActiveAdmin.register Stall do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :seller_id, :market_id

index do
  selectable_column
  column :id
  column :seller_id
  column :market_id
end

form do |f|
  f.inputs "Barraca" do
    f.input :seller_id, :as => :select, :collection => Seller.all.map.map{|s| ["id: #{s.id}, name: #{s.name}, email: #{s.email}", s.id]}
    f.input :market_id, :as => :select, :collection => Market.all
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
