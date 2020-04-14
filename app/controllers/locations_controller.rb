class LocationsController < ApplicationController
  def index
    @concerts = Concert.geocoded # returns flats with coordinates

    @markers = @concerts.map do |concert|
        {
          lat: concert.latitude,
          lng: concert.longitude
        }
    end
  end
end
