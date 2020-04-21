class LocationsController < ApplicationController
  def index
    if params[:query].present?
      @users_sort_genre = User.where('genres @> ?', "{#{current_user.band.genre}}")
      @users_sort_genre_city = @users_sort_genre.where("location ILIKE ?", params[:query]).select("latitude, longitude, location, COUNT(users.*) as number_of_users").
        group(:location, :latitude, :longitude).
        geocoded
    else
      @users_sort_genre = User.where('genres @> ?', "{#{current_user.band.genre}}")
      @users_sort_genre_city = @users_sort_genre.select("latitude, longitude, location, COUNT(users.*) as number_of_users").
        group(:location, :latitude, :longitude).
        geocoded.
        sort_by &:number_of_users
      @users_sort_genre_city.reverse!
    end
    # Get total users in each city, store in hash
    @total_users_in_city = Hash.new(0)
    User.all.each do |user|
      @total_users_in_city["#{user.location}"] += 1
    end

    # Get average price in each city, store in hash
    @price_per_city = Hash.new(0)
    Concert.all.each do |concert|
      concert_location = /.+, (.+)$/.match(concert.address)[1]
      @price_per_city["number_of_concerts_in_#{concert_location}"] += 1
      @price_per_city["total_price_in_#{concert_location}"] += concert.price_cents
      @price_per_city["average_price_in_#{concert_location}"] = @price_per_city["total_price_in_#{concert_location}"] / @price_per_city["number_of_concerts_in_#{concert_location}"]
    end

    @band_location = [current_user.longitude, current_user.latitude]

    @markers = @users_sort_genre_city.flat_map do |user_data|
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
