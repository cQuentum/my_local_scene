class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in? && current_user.genres && current_user.location && current_user.move_radius
      geo_accurate_concerts = Concert.near("#{current_user.location}", current_user.move_radius)
      @concerts = geo_accurate_concerts.joins(:band).where(bands: {genre: current_user.genres} ).sort_by &:start_time
    else
      @concerts = Concert.all.reverse
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:title, :address, :description, :external_link, :price_cents, :confirmed, :start_time, :end_time, :latitude, :longitude, :photo)
  end
end
