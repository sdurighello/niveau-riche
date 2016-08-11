Rails.application.routes.draw do

  devise_for :users
  root 'ports#index', as: :homepage

  # Bookings routes
  resources :bookings
  post 'bookings/summary' => 'bookings#summary'
  get 'user_booking/:user_id' => 'bookings#user', as: :user_bookings

  # Submarines routes
  resources :submarines

  # Ports routes
  resources :ports
  post '/ports/test_availability', to: 'ports#available_submarines'

end
