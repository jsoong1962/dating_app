class MatchesController < ApplicationController

  def index
    if current_user
      @matches = current_user.matches
    else
      redirect_to login_path
    end 
  end

end
