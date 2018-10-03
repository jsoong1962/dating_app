class SearchesController < ApplicationController

  def new
    @search = Search.new
    @interests = Interest.all.map {|interest| interest.name}
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find_by(id: params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:interest, :min_age, :max_age, :gender, :location)
  end

end
