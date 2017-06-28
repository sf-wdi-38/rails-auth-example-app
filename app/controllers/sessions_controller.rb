class SessionsController < ApplicationController
  # # show login page (form)
  # get '/login', to: 'sessions#new', as: 'login'
  def new
    @user = User.new
    @current_user = User.find_by_id(session[:user_id])
  end
  # # actually logs someone in
  # post '/login', to: 'sessions#create'
  def create
    # check User model for a match on email - does user exist?
    user = User.find_by_email(user_params[:email])
    # conditional - did we find a match or not?
    if !user.nil?
    # if user exists:
    	# check if password matches
      if user.authenticate(user_params[:password])
    	# if password matches:
        # record that the user is logged in (set info in session)
        session[:user_id] = user.id
    		# redirect to home page or success page
        redirect_to "/"
      else
      # if password doesn't match:
        # flash error (user name or password may be wrong)
        flash[:errors] = "User email or password is incorrect."
    		# FUTURE: flash notice that asks if password is forgotten (reset through email)
    		# FUTURE: increase some incorrect login counter in session
    		# redirect to page with login form (also has signup link)
        redirect_to login_path
      end
    else
    # if user doesn't exist:
    	# flash error (user name or password may be wrong)
      flash[:errors] = "User email or password may be incorrect"
    	# flash notice that asks if password is forgotten (reset through email)
    	# increase some incorrect login counter in session (if counter too high...?)
    	# redirect to page with login form (also has sign up link)
      redirect_to login_path
    end


  end
  # # handle request from clicking the logout link
  # get '/logout', to: 'sessions#destroy', as: 'logout'
  def destroy
  end

  private
    def user_params
      params.require(:user).permit([:email, :password])
    end
end
