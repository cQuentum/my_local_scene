class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end


  private

  def concert_params
    params.require(:nation).permit(:capital_name, :price_per_day, :name, :description, :photo)
  end

  def set_concert
    @concert = Concert.find(params[:id])
  end
end
