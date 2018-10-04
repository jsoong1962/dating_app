class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new

  end

  def create
  @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Username or Password is incorrect.'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You are logged out."
    redirect_to login_path
  end

end
