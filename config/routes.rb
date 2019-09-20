Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  #get '/logout',  to: 'sessions#destroy'
 delete '/logout',  to: 'sessions#destroy'
  post '/events/new',  to: 'events#create'
  patch '/events/:id/edit', to: 'events#update'
  #get '/events',    to: 'events#index'
  
  resources :users
  resources :events, only: %i[show index new create edit update]
  root 'static_pages#home'

end
