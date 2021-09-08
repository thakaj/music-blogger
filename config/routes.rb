Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :albums, only: [:create, :show, :index]
  resources :artists, only: [:create, :show, :index]
  resources :users 
end
