Rails.application.routes.draw do
  resources :posts do
    resources :comments, shallow: true        #nested route -a shallow route shallow true in documentation
  end
 
  resources :artists, only: [:create, :show, :index] do
    resources :albums, only: [:create, :show, :index]  
  end

  resources :users, except: [:index, :update]  #index only needed if you want users to look up other users ---possibly nested route for posts --> stretch goal
  resources :sessions, only: [:create, :destroy]
  
  #post '/login', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'

end
