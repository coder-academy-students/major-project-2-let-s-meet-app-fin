class UserController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find_by(id: current_user.id)
  end

  def update_profile
    @user = User.find_by(id: current_user.id)
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to "/user/profile", notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nick_name, :avatar)
    end
end
