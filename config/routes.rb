Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  devise_for :farmers

  resources :products
  resources :markets

  # only for farmer control
  get 'overview', to: "overview#index"
end
