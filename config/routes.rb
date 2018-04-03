Rails.application.routes.draw do

  root 'trips#index'

  get '/trips', to: 'trips#index', as: 'trips'
  get 'trips/new', to: 'trips#new', as: 'new_trip'
  post '/trips', to: 'trips#create'
  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  get '/trips/:id', to: 'trips#show', as: 'trip'
  patch '/trips/:id', to: 'trips#update'
  delete '/trips/:id', to: 'trips#destroy'
end
