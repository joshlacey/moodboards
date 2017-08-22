Rails.application.routes.draw do
  resources :boards, :users, :images, :projects

  root 'sessions#new'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/comments', to: 'comments#create'


end
