Rails.application.routes.draw do
  resources :flights, only: [:index]
  resources :airports
  resources :bookings, only: [:new, :create, :show]
  resources :passengers, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "flights#index"
end
