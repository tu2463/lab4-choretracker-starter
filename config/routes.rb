Rails.application.routes.draw do
  resources :chores
  resources :tasks
  resources :children
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
