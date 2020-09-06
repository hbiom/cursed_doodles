class UsersController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @user = User.new
    @user.event = @event
  end

  def create
    @user = User.new
    @event = Event.find(params[:event_id])
    @user = User.new(user_params)
    @user.event = @event
    @user.save

    if @user.save
      redirect_to new_user_uptime_path(@user)
    end
  end


  def create_orga
    @event = Event.find(params[:id])
    @user = User.new
    @user.event = @event
    @user = User.new(user_params_orga)
    @user.role = "Organisator"

    if @user.save
      redirect_to new_user_uptime_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end

  def user_params_orga
    params.permit(:user).permit(:name, :role)
  end

end
