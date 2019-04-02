Rails.application.routes.draw do
  resources :posts
  get '/posts/new', to: 'posts#new'
  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'

  # get 'posts/new'
  # get 'posts/edit'
  # get 'posts/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/', to: 'home#index'
  
  get 'about', to: 'about#index'
  
  get '/bushido', to: 'bushido#index'

  resources :media

  resources :users
  get '/user', to: 'users#my_profile'
  get '/user/:id/edit', to: 'users#edit'
  get '/users/:id', to: 'users#show'

  get '/login', to: 'sessions#login'
  post '/sign_in', to: 'sessions#sign_in'
  get '/sign_out', to: 'sessions#sign_out'

  get 'credits', to: 'credits#index'
end