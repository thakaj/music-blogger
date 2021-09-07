Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :albums, only: [:create, :show]
  resources :artists, only: [:create, :show]
  resources :users , only: [:create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
