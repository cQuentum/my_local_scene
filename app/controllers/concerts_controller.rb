class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show]

  def index
    if params[:query].present?
      @concerts = Concert.where("address ILIKE ?", "%#{params[:query]}%").sort_by &:start_time
    else
      @concerts = Concert.all.sort_by &:start_time
    end
  end

  def show
  end

  def new
  end

  def create
  end


  private

  def concert_params
    params.require(:concert).permit(:title, :address, :description, :external_link, :price_cents, :confirmed, :start_time, :latitude, :longitude, :photo)
  end

  def set_concert
    @concert = Concert.find(params[:id])
  end
end
