class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user

  # protect_from_forgery with: :exception
  # include SessionsHelper
  #
  # helper_method :current_user
  #
  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end
  #
  # def current_user
  #   User.find_by({ id: session[:user_id] })
  # end

  def current_user
    User.find_by({ id: session[:user_id] })
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

end
