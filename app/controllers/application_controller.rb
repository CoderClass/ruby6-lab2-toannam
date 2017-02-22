class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :signed_in?
  def signed_in?
    return session[:user_id].nil? ? false : true
  end
  def current_user
    return @current_user if @current_user

    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
end
