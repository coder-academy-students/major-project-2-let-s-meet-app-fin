class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_user
  helper_method :get_geo_location

  def get_user
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
  end

  def get_geo_location
    lat_long = cookies[:lat_long]
    if lat_long
      @geolocation = lat_long.split("|")
    end

    if @geolocation && user_signed_in?
      @user.latitude = @geolocation[0].to_f
      @user.longitude = @geolocation[1].to_f
      @user.save
    end
  end
end
