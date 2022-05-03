Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories
  resources :transactions
  # Defines the root path route ("/")
  root 'categories#index'
end
