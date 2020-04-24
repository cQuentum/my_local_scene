class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show]

  def index
    if user_signed_in?
      if params[:query].present?
        @concerts_query = Concert.near(params[:query])
        @concerts = @concerts_query.joins(:band).where(bands: {genre: current_user.genres} ).where('start_time >= ?', DateTime.now).sort_by &:start_time
      else
        @concerts = Concert.includes(:band).where(bands: {genre: current_user.genres} ).where('start_time >= ?', DateTime.now).sort_by &:start_time
      end
    else
      if params[:query].present?
        @concerts_query = Concert.near(params[:query])
        @concerts = @concerts_query.joins(:band).where('start_time >= ?', DateTime.now).sort_by &:start_time
      else
        @concerts = Concert.includes(:band).where('start_time >= ?', DateTime.now).sort_by &:start_time
      end
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
