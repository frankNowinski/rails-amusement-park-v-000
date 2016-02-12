Rails.application.routes.draw do
  root'static#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :rides
  resources :users
  resources :attractions
end
