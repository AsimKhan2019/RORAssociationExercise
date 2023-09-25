Rails.application.routes.draw do
  resources :accounts
  resources :payments
  resources :clients
  resources :subscriptions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'subscriptions#index'
end
