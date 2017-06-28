class UsersController < ApplicationController


  # show sign up form page
  # get '/signup', to: 'users#new'
  def new
    @user = User.new
  end
  # actually add user to db
  # post '/users', to: 'users#create'
  def create
  end
end
