class HomeController < ApplicationController

  def index
    get_geo_location

    if user_signed_in?
      @my_event = Event.where(:user_id => current_user.id).last
      @invitations = Invitation.where(:guest_id => current_user.id)
    end
  end

end
