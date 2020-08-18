class UsersController < ApplicationController

  def new
    @event = Event.find(params[:event_id])

    @user = User.new
    @user.event = @event
  end

  # def create
  #   @user = User.new
  #   @event = Event.find(params[:event_id])
  #   @user = User.new(user_params)
  #   @user.event = @event
  #   if @user.save
  #     redirect_to new_user_uptime_path(@user)
  #   end
  # end

  def create_orga
    @event = Event.find(params[:id])
    @user = User.new
    @user.event = @event
    @user = User.new(user_params_orga)
    @user.role = "organisator"

    start_time_orga = @event.start_time
    ending_time_orga = @event.ending_at

    if @user.save
      redirect_to create_uptime_path(@user) # find correct routes
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
