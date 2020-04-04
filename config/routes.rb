Rails.application.routes.draw do
  resources :reservations
  resources :line_items
  resources :carts
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
