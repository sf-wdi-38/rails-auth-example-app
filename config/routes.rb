Rails.application.routes.draw do
  # show login page (form)
  get '/login', to: 'sessions#new', as: 'login'
  # actually logs someone in
  post '/login', to: 'sessions#create'
  # handle request from clicking the logout link
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # show sign up form page
  get '/signup', to: 'users#new', as: 'signup'
  # actually add user to db
  post '/users', to: 'users#create'
end
