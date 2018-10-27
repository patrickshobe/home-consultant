Rails.application.routes.draw do
  root 'session#new'
  post '/', to: 'session#create'
  post '/search', to: 'search#create'

  resources :search, only: [:new]
end
