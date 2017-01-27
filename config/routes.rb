Rails.application.routes.draw do
  devise_for :farmers
  devise_for :users
  devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :products
  resources :markets

  # only for farmer control
  get 'overview', to: "overview#index"
end
