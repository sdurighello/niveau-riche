Rails.application.routes.draw do

  root 'ports#index', as: :homepage

  # Bookings routes
  resources :bookings

  # Submarines routes
  resources :submarines

  # Ports routes
  resources :ports

end
