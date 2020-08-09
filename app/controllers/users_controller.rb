class UsersController < ApplicationController

  def new
    @event = Event.find(params[:event_id])

    @user = User.new
    @user.event = @event

    # @user = User.new(user_params)

    # @event = Event.find(params[:event_id])
    # @user.event_id = @event.id
    # if @user.save
    #   new_user_uptime_path(@user)
    # end
  end

  def create
    @user = User.new
    @event = Event.find(params[:event_id])
    @user = User.new(user_params)
    @user.event = @event
    if @user.save
      redirect_to new_user_uptime_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end

end
