Rails.application.routes.draw do
  root 'trips#index'

  resources :drivers
  resources :passengers
  resources :trips
end
