class HomeController < ApplicationController
  def index
    lat_long = cookies[:lat_long]
    if lat_long
      @geolocation = lat_long.split("|")
    end

    if @geolocation && user_signed_in?
      current_user.latitude = @geolocation[0].to_f
      current_user.longitude = @geolocation[1].to_f
      current_user.save
    end
  end
end
