Rails.application.routes.draw do

  root 'bookings#homepage'

  # Bookings routes
  resources :bookings

  # Submarines routes
  resources :submarines

  # Ports routes
  resources :ports

end
