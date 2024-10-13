Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords',
    confirmations: 'customers/confirmations',
    unlocks: 'customers/unlocks',
    omniauth_callbacks: 'customers/omniauth_callbacks'
  }

  root to: 'customers/dashboard#index'

  namespace :customers do
    resources :dashboard, only: [:index]
  end

  get '/products', to: 'products#index'
  
  mount ShopifyApp::Engine, at: '/'
end