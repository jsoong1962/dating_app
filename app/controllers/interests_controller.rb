class InterestsController < ApplicationController
  before_action :find_interest, only: [:show, :edit, :update, :destroy]

  def index
    @interests = Interest.all
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.create(interest_params)
    redirect_to @interest
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    @interest.destroy
    redirect_to interests_path
  end

  private

  def interest_params
    params.require(:interest).permit(:name)
  end

  def find_interest
    @interest = Interest.find_by(id: params[:id])
  end

end
