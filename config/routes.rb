Rails.application.routes.draw do
  root "cities#index"
  devise_for :users
  resources :cities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  
end
