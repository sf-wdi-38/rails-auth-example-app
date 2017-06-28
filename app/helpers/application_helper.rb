module ApplicationHelper
  def current_user
    if !@current_user.nil?
      @current_user
    elsif session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
    else
      @current_user = nil
    end
  end
end
