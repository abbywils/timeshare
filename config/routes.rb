Rails.application.routes.draw do
  resources :payments
  # checkout_path(@cart) -> cart controller, checkout method, pass information about the cart
  post '/carts/:id/checkout', to: 'carts#checkout', as: 'checkout'
  post '/carts/:id/emptycart', to: 'carts#emptycart', as: 'emptycart'
  
  
  resources :reservations
  resources :line_items
  resources :carts, only: [:index, :show]
  
  get '/login', to: 'sessions#new'
  
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users
  resources :sites
  resources :countries
  get 'timeshare/index'

   root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
