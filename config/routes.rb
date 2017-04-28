Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  devise_for :sellers

  resources :products
  resources :markets
  resources :stalls, only: [:index, :create, :new, :destroy]

  get '/search', to: 'markets#search'

  # only for seller control

  get '/overview', to: "overview#index"
  get "/my_orders", to: 'overview#my_orders'

  get "/my_products", to: 'overview#my_products'
  post "/create_product", to: 'overview#create_product'
  delete "/destroy_product", to: 'overview#destroy_product'
  get "/edit_price", to: 'overview#edit_price'

  get "/my_stalls", to: 'overview#my_stalls'
  post "/create_stall", to: 'overview#create_stall'
  delete "/destroy_stall", to: 'overview#destroy_stall'
end

=begin
                    Prefix Verb   URI Pattern                      Controller#Action
                      root GET    /                                pages#home
          new_user_session GET    /users/sign_in(.:format)         devise/sessions#new
              user_session POST   /users/sign_in(.:format)         devise/sessions#create
      destroy_user_session DELETE /users/sign_out(.:format)        devise/sessions#destroy
         new_user_password GET    /users/password/new(.:format)    devise/passwords#new
        edit_user_password GET    /users/password/edit(.:format)   devise/passwords#edit
             user_password PATCH  /users/password(.:format)        devise/passwords#update
                           PUT    /users/password(.:format)        devise/passwords#update
                           POST   /users/password(.:format)        devise/passwords#create
  cancel_user_registration GET    /users/cancel(.:format)          devise/registrations#cancel
     new_user_registration GET    /users/sign_up(.:format)         devise/registrations#new
    edit_user_registration GET    /users/edit(.:format)            devise/registrations#edit
         user_registration PATCH  /users(.:format)                 devise/registrations#update
                           PUT    /users(.:format)                 devise/registrations#update
                           DELETE /users(.:format)                 devise/registrations#destroy
                           POST   /users(.:format)                 devise/registrations#create
        new_seller_session GET    /sellers/sign_in(.:format)       devise/sessions#new
            seller_session POST   /sellers/sign_in(.:format)       devise/sessions#create
    destroy_seller_session DELETE /sellers/sign_out(.:format)      devise/sessions#destroy
       new_seller_password GET    /sellers/password/new(.:format)  devise/passwords#new
      edit_seller_password GET    /sellers/password/edit(.:format) devise/passwords#edit
           seller_password PATCH  /sellers/password(.:format)      devise/passwords#update
                           PUT    /sellers/password(.:format)      devise/passwords#update
                           POST   /sellers/password(.:format)      devise/passwords#create
cancel_seller_registration GET    /sellers/cancel(.:format)        devise/registrations#cancel
   new_seller_registration GET    /sellers/sign_up(.:format)       devise/registrations#new
  edit_seller_registration GET    /sellers/edit(.:format)          devise/registrations#edit
       seller_registration PATCH  /sellers(.:format)               devise/registrations#update
                           PUT    /sellers(.:format)               devise/registrations#update
                           DELETE /sellers(.:format)               devise/registrations#destroy
                           POST   /sellers(.:format)               devise/registrations#create
                  products GET    /products(.:format)              products#index
                           POST   /products(.:format)              products#create
               new_product GET    /products/new(.:format)          products#new
              edit_product GET    /products/:id/edit(.:format)     products#edit
                   product GET    /products/:id(.:format)          products#show
                           PATCH  /products/:id(.:format)          products#update
                           PUT    /products/:id(.:format)          products#update
                           DELETE /products/:id(.:format)          products#destroy
                   markets GET    /markets(.:format)               markets#index
                           POST   /markets(.:format)               markets#create
                new_market GET    /markets/new(.:format)           markets#new
               edit_market GET    /markets/:id/edit(.:format)      markets#edit
                    market GET    /markets/:id(.:format)           markets#show
                           PATCH  /markets/:id(.:format)           markets#update
                           PUT    /markets/:id(.:format)           markets#update
                           DELETE /markets/:id(.:format)           markets#destroy
                    stalls GET    /stalls(.:format)                stalls#index
                           POST   /stalls(.:format)                stalls#create
                 new_stall GET    /stalls/new(.:format)            stalls#new
                     stall DELETE /stalls/:id(.:format)            stalls#destroy
                    search GET    /search(.:format)                markets#search
                  overview GET    /overview(.:format)              overview#index
                 my_orders GET    /my_orders(.:format)             overview#my_orders
               my_products GET    /my_products(.:format)           overview#my_products
            create_product POST   /create_product(.:format)        overview#create_product
           destroy_product DELETE /destroy_product(.:format)       overview#destroy_product
                 my_stalls GET    /my_stalls(.:format)             overview#my_stalls
              create_stall POST   /create_stall(.:format)          overview#create_stall
             destroy_stall DELETE /destroy_stall(.:format)         overview#destroy_stall

=end
