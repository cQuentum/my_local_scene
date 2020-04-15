class MyConcertsController < ApplicationController
  def show
  end

  def new
    @concert = Concert.new
  end

  def create
    @band = current_user.band
    @concert = Concert.new(concert_params)
    @concert.price_cents = @concert.price_cents * 100
    @concert.confirmed = true
    @concert.band = @band
    if @concert.save
      redirect_to my_concert_path(@concert)
    else
      render :new
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:photo, :title, :address, :description, :external_link, :price_cents, :start_time, :end_time, :confirmed)
  end
end
