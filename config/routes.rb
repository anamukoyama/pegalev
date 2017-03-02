Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  devise_for :farmers

  resources :products
  resources :markets

  # only for farmer control
  get 'overview', to: "overview#index"
end

# Nossas routes apenas para conferência
#                    Prefix Verb   URI Pattern                      Controller#Action
#        new_farmer_session GET    /farmers/sign_in(.:format)       devise/sessions#new
#            farmer_session POST   /farmers/sign_in(.:format)       devise/sessions#create
#    destroy_farmer_session DELETE /farmers/sign_out(.:format)      devise/sessions#destroy
#       new_farmer_password GET    /farmers/password/new(.:format)  devise/passwords#new
#      edit_farmer_password GET    /farmers/password/edit(.:format) devise/passwords#edit
#           farmer_password PATCH  /farmers/password(.:format)      devise/passwords#update
#                           PUT    /farmers/password(.:format)      devise/passwords#update
#                           POST   /farmers/password(.:format)      devise/passwords#create
#cancel_farmer_registration GET    /farmers/cancel(.:format)        devise/registrations#cancel
#   new_farmer_registration GET    /farmers/sign_up(.:format)       devise/registrations#new
#  edit_farmer_registration GET    /farmers/edit(.:format)          devise/registrations#edit
#       farmer_registration PATCH  /farmers(.:format)               devise/registrations#update
#                           PUT    /farmers(.:format)               devise/registrations#update
#                           DELETE /farmers(.:format)               devise/registrations#destroy
#                           POST   /farmers(.:format)               devise/registrations#create
#          new_user_session GET    /users/sign_in(.:format)         devise/sessions#new
#              user_session POST   /users/sign_in(.:format)         devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)        devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)    devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)   devise/passwords#edit
#             user_password PATCH  /users/password(.:format)        devise/passwords#update
#                           PUT    /users/password(.:format)        devise/passwords#update
#                           POST   /users/password(.:format)        devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)          devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)         devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)            devise/registrations#edit
#         user_registration PATCH  /users(.:format)                 devise/registrations#update
#                           PUT    /users(.:format)                 devise/registrations#update
#                           DELETE /users(.:format)                 devise/registrations#destroy
#                           POST   /users(.:format)                 devise/registrations#create
#                      root GET    /                                pages#home
#                  products GET    /products(.:format)              products#index
#                           POST   /products(.:format)              products#create
#               new_product GET    /products/new(.:format)          products#new
#              edit_product GET    /products/:id/edit(.:format)     products#edit
#                   product GET    /products/:id(.:format)          products#show
#                           PATCH  /products/:id(.:format)          products#update
#                           PUT    /products/:id(.:format)          products#update
#                           DELETE /products/:id(.:format)          products#destroy
#                   markets GET    /markets(.:format)               markets#index
#                           POST   /markets(.:format)               markets#create
#                new_market GET    /markets/new(.:format)           markets#new
#               edit_market GET    /markets/:id/edit(.:format)      markets#edit
#                    market GET    /markets/:id(.:format)           markets#show
#                           PATCH  /markets/:id(.:format)           markets#update
#                           PUT    /markets/:id(.:format)           markets#update
#                           DELETE /markets/:id(.:format)           markets#destroy
#                  overview GET    /overview(.:format)              overview#index
