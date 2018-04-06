Rails.application.routes.draw do
  root to: 'trips#index'
    resources :trips
  resources :drivers
  resources :passengers do
    resources :trips, only: [:create]
  end

  patch '/drivers/:id/available', to: 'drivers#available', as: 'available'

  patch '/drivers/:id/unavailable', to: 'drivers#unavailable', as: 'unavailable'

end
