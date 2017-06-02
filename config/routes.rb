Rails.application.routes.draw do

  get "carts/show"

  ActiveAdmin.routes(self)
  root to: "pages#home"

  devise_for :users
  devise_for :sellers

  get "/search", to: "markets#search"
  resources :markets, only: [:show] do
    resources :products, only: [:show]
  end

  resource :cart, only: [:show] do
    get "/choose_address", to: "confirmation#choose_address"
    get "/payment", to: "confirmation#payment"
    get "/review", to: "confirmation#review"
  end

  resources :order_items, only: [:create, :update, :destroy]
  resources :sellers, only: [:edit, :update, :show, :destroy]

  get "/overview", to: "overview#index"
  get "/my_orders", to: "overview#my_orders"

  get "/my_products", to: "overview#my_products"
  post "/create_product", to: "overview#create_product"
  delete "/destroy_product", to: "overview#destroy_product"
  get "/edit_price", to: "overview#edit_price"

  get "/my_stalls", to: "overview#my_stalls"
  post "/create_stall", to: "overview#create_stall"
  delete "/destroy_stall", to: "overview#destroy_stall"
end

=begin
ntroller#Action
                 carts_show GET    /carts/show(.:format)                      carts#show
                 admin_root GET    /admin(.:format)                           admin/dashboard#index
 batch_action_admin_sellers POST   /admin/sellers/batch_action(.:format)      admin/sellers#batch_action
              admin_sellers GET    /admin/sellers(.:format)                   admin/sellers#index
                            POST   /admin/sellers(.:format)                   admin/sellers#create
           new_admin_seller GET    /admin/sellers/new(.:format)               admin/sellers#new
          edit_admin_seller GET    /admin/sellers/:id/edit(.:format)          admin/sellers#edit
               admin_seller GET    /admin/sellers/:id(.:format)               admin/sellers#show
                            PATCH  /admin/sellers/:id(.:format)               admin/sellers#update
                            PUT    /admin/sellers/:id(.:format)               admin/sellers#update
                            DELETE /admin/sellers/:id(.:format)               admin/sellers#destroy
   batch_action_admin_users POST   /admin/users/batch_action(.:format)        admin/users#batch_action
                admin_users GET    /admin/users(.:format)                     admin/users#index
                            POST   /admin/users(.:format)                     admin/users#create
             new_admin_user GET    /admin/users/new(.:format)                 admin/users#new
            edit_admin_user GET    /admin/users/:id/edit(.:format)            admin/users#edit
                 admin_user GET    /admin/users/:id(.:format)                 admin/users#show
                            PATCH  /admin/users/:id(.:format)                 admin/users#update
                            PUT    /admin/users/:id(.:format)                 admin/users#update
                            DELETE /admin/users/:id(.:format)                 admin/users#destroy
 batch_action_admin_markets POST   /admin/markets/batch_action(.:format)      admin/markets#batch_action
              admin_markets GET    /admin/markets(.:format)                   admin/markets#index
                            POST   /admin/markets(.:format)                   admin/markets#create
           new_admin_market GET    /admin/markets/new(.:format)               admin/markets#new
          edit_admin_market GET    /admin/markets/:id/edit(.:format)          admin/markets#edit
               admin_market GET    /admin/markets/:id(.:format)               admin/markets#show
                            PATCH  /admin/markets/:id(.:format)               admin/markets#update
                            PUT    /admin/markets/:id(.:format)               admin/markets#update
                            DELETE /admin/markets/:id(.:format)               admin/markets#destroy
batch_action_admin_products POST   /admin/products/batch_action(.:format)     admin/products#batch_action
             admin_products GET    /admin/products(.:format)                  admin/products#index
                            POST   /admin/products(.:format)                  admin/products#create
          new_admin_product GET    /admin/products/new(.:format)              admin/products#new
         edit_admin_product GET    /admin/products/:id/edit(.:format)         admin/products#edit
              admin_product GET    /admin/products/:id(.:format)              admin/products#show
                            PATCH  /admin/products/:id(.:format)              admin/products#update
                            PUT    /admin/products/:id(.:format)              admin/products#update
                            DELETE /admin/products/:id(.:format)              admin/products#destroy
  batch_action_admin_stalls POST   /admin/stalls/batch_action(.:format)       admin/stalls#batch_action
               admin_stalls GET    /admin/stalls(.:format)                    admin/stalls#index
                            POST   /admin/stalls(.:format)                    admin/stalls#create
            new_admin_stall GET    /admin/stalls/new(.:format)                admin/stalls#new
           edit_admin_stall GET    /admin/stalls/:id/edit(.:format)           admin/stalls#edit
                admin_stall GET    /admin/stalls/:id(.:format)                admin/stalls#show
                            PATCH  /admin/stalls/:id(.:format)                admin/stalls#update
                            PUT    /admin/stalls/:id(.:format)                admin/stalls#update
                            DELETE /admin/stalls/:id(.:format)                admin/stalls#destroy
            admin_dashboard GET    /admin/dashboard(.:format)                 admin/dashboard#index
             admin_comments GET    /admin/comments(.:format)                  admin/comments#index
                            POST   /admin/comments(.:format)                  admin/comments#create
              admin_comment GET    /admin/comments/:id(.:format)              admin/comments#show
                            DELETE /admin/comments/:id(.:format)              admin/comments#destroy
                       root GET    /                                          pages#home
           new_user_session GET    /users/sign_in(.:format)                   devise/sessions#new
               user_session POST   /users/sign_in(.:format)                   devise/sessions#create
       destroy_user_session DELETE /users/sign_out(.:format)                  devise/sessions#destroy
          new_user_password GET    /users/password/new(.:format)              devise/passwords#new
         edit_user_password GET    /users/password/edit(.:format)             devise/passwords#edit
              user_password PATCH  /users/password(.:format)                  devise/passwords#update
                            PUT    /users/password(.:format)                  devise/passwords#update
                            POST   /users/password(.:format)                  devise/passwords#create
   cancel_user_registration GET    /users/cancel(.:format)                    devise/registrations#cancel
      new_user_registration GET    /users/sign_up(.:format)                   devise/registrations#new
     edit_user_registration GET    /users/edit(.:format)                      devise/registrations#edit
          user_registration PATCH  /users(.:format)                           devise/registrations#update
                            PUT    /users(.:format)                           devise/registrations#update
                            DELETE /users(.:format)                           devise/registrations#destroy
                            POST   /users(.:format)                           devise/registrations#create
         new_seller_session GET    /sellers/sign_in(.:format)                 devise/sessions#new
             seller_session POST   /sellers/sign_in(.:format)                 devise/sessions#create
     destroy_seller_session DELETE /sellers/sign_out(.:format)                devise/sessions#destroy
        new_seller_password GET    /sellers/password/new(.:format)            devise/passwords#new
       edit_seller_password GET    /sellers/password/edit(.:format)           devise/passwords#edit
            seller_password PATCH  /sellers/password(.:format)                devise/passwords#update
                            PUT    /sellers/password(.:format)                devise/passwords#update
                            POST   /sellers/password(.:format)                devise/passwords#create
 cancel_seller_registration GET    /sellers/cancel(.:format)                  devise/registrations#cancel
    new_seller_registration GET    /sellers/sign_up(.:format)                 devise/registrations#new
   edit_seller_registration GET    /sellers/edit(.:format)                    devise/registrations#edit
        seller_registration PATCH  /sellers(.:format)                         devise/registrations#update
                            PUT    /sellers(.:format)                         devise/registrations#update
                            DELETE /sellers(.:format)                         devise/registrations#destroy
                            POST   /sellers(.:format)                         devise/registrations#create
                     search GET    /search(.:format)                          markets#search
             market_product GET    /markets/:market_id/products/:id(.:format) products#show
                     market GET    /markets/:id(.:format)                     markets#show
        choose_address_cart GET    /cart/choose_address(.:format)             confirmation#choose_address
               payment_cart GET    /cart/payment(.:format)                    confirmation#payment
                review_cart GET    /cart/review(.:format)                     confirmation#review
                       cart GET    /cart(.:format)                            carts#show
                order_items POST   /order_items(.:format)                     order_items#create
                 order_item PATCH  /order_items/:id(.:format)                 order_items#update
                            PUT    /order_items/:id(.:format)                 order_items#update
                            DELETE /order_items/:id(.:format)                 order_items#destroy
                   overview GET    /overview(.:format)                        overview#index
                  my_orders GET    /my_orders(.:format)                       overview#my_orders
                my_products GET    /my_products(.:format)                     overview#my_products
             create_product POST   /create_product(.:format)                  overview#create_product
            destroy_product DELETE /destroy_product(.:format)                 overview#destroy_product
                 edit_price GET    /edit_price(.:format)                      overview#edit_price
                  my_stalls GET    /my_stalls(.:format)                       overview#my_stalls
               create_stall POST   /create_stall(.:format)                    overview#create_stall
              destroy_stall DELETE /destroy_stall(.:format)                   overview#destroy_stall

=end
