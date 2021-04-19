Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  # resources :users
  resources :posts
  # resources :posts do 
  root 'hello#index'
end
