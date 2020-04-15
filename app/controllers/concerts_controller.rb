class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show]

  def index
    @concerts = Concert.all.reverse
  end

  def show
  end

  def new
  end

  def create
  end


  private

  def concert_params
    params.require(:concert).permit(:title, :address, :description, :external_link, :price_cents, :confirmed, :start_time, :end_time, :latitude, :longitude, :photo)
  end

  def set_concert
    @concert = Concert.find(params[:id])
  end
end
