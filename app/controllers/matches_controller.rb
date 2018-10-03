class MatchesController < ApplicationController

  def index
    if current_user
      @matches = current_user.matches
    else
      redirect_to login_path
    end
  end

  def create
    @user = User.find(params[:matched_id])
    current_user.match(@user)
    redirect_to @user
  end

  def destroy
    @user = Match.find(params[:id]).matched
    current_user.unmatch(@user)
    redirect_to @user
  end

end
