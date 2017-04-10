Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  devise_for :sellers


  resources :products
  resources :markets
  resources :stalls, only: [:index, :create, :new, :destroy]

  # only for seller control
  get '/search', to: 'markets#search'
  get 'overview', to: "overview#index"
  get "/my_orders", to: 'pages#my_orders'
  get "/my_products", to: 'pages#my_products'
  get "/my_stalls", to: 'pages#my_stalls'
end

# Nossas routes apenas para conferência
#                    Prefix Verb   URI Pattern                      Controller#Action
#        new_seller_session GET    /sellers/sign_in(.:format)       devise/sessions#new
#            seller_session POST   /sellers/sign_in(.:format)       devise/sessions#create
#    destroy_seller_session DELETE /sellers/sign_out(.:format)      devise/sessions#destroy
#       new_seller_password GET    /sellers/password/new(.:format)  devise/passwords#new
#      edit_seller_password GET    /sellers/password/edit(.:format) devise/passwords#edit
#           seller_password PATCH  /sellers/password(.:format)      devise/passwords#update
#                           PUT    /sellers/password(.:format)      devise/passwords#update
#                           POST   /sellers/password(.:format)      devise/passwords#create
#cancel_seller_registration GET    /sellers/cancel(.:format)        devise/registrations#cancel
#   new_seller_registration GET    /sellers/sign_up(.:format)       devise/registrations#new
#  edit_seller_registration GET    /sellers/edit(.:format)          devise/registrations#edit
#       seller_registration PATCH  /sellers(.:format)               devise/registrations#update
#                           PUT    /sellers(.:format)               devise/registrations#update
#                           DELETE /sellers(.:format)               devise/registrations#destroy
#                           POST   /sellers(.:format)               devise/registrations#create
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
#                   stalls GET    /stalls(.:format)                stalls#index
#                           POST   /stalls(.:format)                stalls#create
#                 new_stall GET    /stalls/new(.:format)            stalls#new
#                           DELETE /stalls/:id(.:format)            stalls#destroy
#                    search GET    /search(.:format)                markets#search
#                  overview GET    /overview(.:format)              overview#index
#                 my_orders GET    /my_orders(.:format)             pages#my_orders
#               my_products GET    /my_products(.:format)           pages#my_products
#                 my_stalls GET    /my_stalls(.:format)             pages#my_stalls
