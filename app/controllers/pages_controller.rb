class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @concerts = Concert.all.reverse
  end

  private

  def concert_params
    params.require(:concert).permit(:title, :address, :description, :external_link, :price_cents, :confirmed, :start_time, :end_time, :latitude, :longitude, :photo)
  end
end
