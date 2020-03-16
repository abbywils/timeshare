Rails.application.routes.draw do
  resources :sites
  resources :countries
  get 'timeshare/index'

  root 'volcanomappr#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
