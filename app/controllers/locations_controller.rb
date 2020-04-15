class LocationsController < ApplicationController
  def index
    @users = User.geocoded # returns users with coordinates

    @markers = @users.map do |user|
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user })
        }
    end
  end
end
