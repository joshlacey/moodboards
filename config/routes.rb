Rails.application.routes.draw do
  resources :boards, :users, :images, :projects

  root 'sessions#new'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/comments', to: 'comments#create'
  post '/projects/approve', to: 'projects#approve_project', as: 'approve_project'
  post '/projects/reject', to: 'projects#reject_project', as: 'reject_project'
  get '/email_user/:id', to: 'users#new_email_message', as: 'email_user'
  post '/send_user_email/:id', to: 'users#send_email', as: 'send_email'


end
