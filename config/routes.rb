Rails.application.routes.draw do
  devise_for :users
  root  "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users, only: [:create, :new, :update]
  resources :pets, only: [:create, :new, :show, :edit, :update, :destroy]
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]

  # Nested bookings for pets
  resources :pets do
    resources :bookings, only: [:new, :create]
  end

  get 'my_pets', to: 'pets#my_pets', as: :my_pets

  if Rails.env.production?
  get '/run_seeds', to: 'seeds#run'
  end
end
