class UsersController < ApplicationController


  # show sign up form page
  # get '/signup', to: 'users#new'
  def new
    @user = User.new
  end
  # actually add user to db
  # post '/users', to: 'users#create'
  def create
    # have name, email, password that person wants to use user_params
    # user model:
      # validate that username is unique  (can add in User model)
      # validate against other criteria for user names (can't have a one-letter username, language filter)
      # create obscured version of password with BCrypt::Password.create
    # attempt to save user in database with username, password obscured version of password from the form
    user = User.new(user_params)
    if user.save
    # if user saves properly:
    	# TODO: redirect to a user created page with instructions for email confirmation
      # TODO: log user in
    	# redirect to home / success
      redirect_to "/"
    else
    # if user does not save:
    	# flash error message (with specifics!)
      flash[:errors] = user.errors.full_messages.join(" ")
    	# redirect to sign up form (/users/new)
      redirect_to signup_path
    end

  end

  private
    def user_params
      params.require(:user).permit([:email, :name, :password])
    end
end
