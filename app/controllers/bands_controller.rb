class BandsController < ApplicationController
  before_action :set_band

  def index
  end

  def show
    @band_show = Band.find(params[:id])
    @band = Band.where(user_id: current_user.id)
    @participations = Participation.where(concert: @concert)
    @concerts = Concert.where(band: @band_show)
    @future_concerts = @concerts.where('start_time >= ?', DateTime.now)
  end

  def new
    @band = Band.new
  end

  def create
    @band = current_user.band
    @band = Band.new(band_params)
    @band.user = current_user
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :genre, :description, :external_link, :photo)
  end

  def set_band
    @band = Band.find(params[:id])
  end
end
