class HomeController < ApplicationController
  def index
    get_geo_location
    
    if user_signed_in?
      @my_event = Event.where(:user_id => current_user.id).last
      @invitations = Invitation.where(:guest_id => current_user.id)
    end
  end

  def get_geo_location
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
