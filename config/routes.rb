Rails.application.routes.draw do
  resources :posts
 

  resources :users, only: [:create]  #index only needed if you want users to look up other users ---possibly nested route for posts --> stretch goal
  get "/me", to: "users#show"
  delete "/logout", to: "sessions#destroy" 
  post "/login", to: "sessions#create" 
  #resources :sessions, only: [:create, :destroy]
  
  #post '/login', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'

end
