Rails.application.routes.draw do

  root 'ports#index', as: :homepage

  # Bookings routes
  resources :bookings
  post 'bookings/summary' => 'bookings#summary'
  
  # Submarines routes
  resources :submarines

  # Ports routes
  resources :ports
  post '/ports/test_availability', to: 'ports#available_submarines'

end
