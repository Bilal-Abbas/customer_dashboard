Rails.application.routes.draw do
  devise_for :customers

  root to: 'customers/dashboard#index'

  namespace :customers do
    resources :dashboard, only: [:index]
  end

  get '/products', to: 'products#index'
  
  mount ShopifyApp::Engine, at: '/'
end