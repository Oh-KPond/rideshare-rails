Rails.application.routes.draw do
  patch '/drivers/:id/available', to: 'drivers#available', as: 'available'

  patch '/drivers/:id/unavailable', to: 'drivers#unavailable', as: 'unavailable'

  resources :drivers
  resources :passengers do
    resources :trips, only: [:new]
  end
  resources :trips
end
