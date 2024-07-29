Rails.application.routes.draw do
  resources :channels do
    resource :channel_user
    resources :messages
  end

  devise_for :users
  root 'channels#index'

  #resources :notifications, only: [:index]
  resources :notifications

  #get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
