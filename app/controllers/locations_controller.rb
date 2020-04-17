class LocationsController < ApplicationController
def index
    if params[:query].present?
    @users_data = User.where("location ILIKE ?", params[:query]).select("latitude, longitude, location, COUNT(users.*) as number_of_users").
              group(:location, :latitude, :longitude).
              geocoded
    else
      @users_data = User.select("latitude, longitude, location, COUNT(users.*) as number_of_users").
              group(:location, :latitude, :longitude).
              geocoded
    end
    @markers = @users_data.flat_map do |user_data|
      user_data.number_of_users.times.map do
        {
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [user_data.longitude, user_data.latitude]
          },
          "properties": {
            "location": user_data.location,
            "userCount": user_data.number_of_users
            # "infoWindow": render_to_string(...)
          }
        }
      end
    end
  end
end
