Rails.application.routes.draw do
  resources :posts, except: [:show]
  get "/me", to: "users#show"
  resources :users, only: [:create]  
 

  delete "/logout", to: "sessions#destroy" 
  post "/login", to: "sessions#create" 
  #resources :sessions, only: [:create, :destroy]
  

end
