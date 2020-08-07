class UsersController < ApplicationController

  def new
    @user = User.new
    # @user = User.new(user_params)

    @event = Event.find(params[:event_id])
    # @user.event_id = @event.id
    # if @user.save
    #   new_user_uptime_path(@user)
    # end
  end

  def create
    # @user = User.new
    @user = User.new(user_params)
    @event = Event.find(params[:event_id])
    @user.event_id = @event.id
    if @user.save
      new_user_uptime_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role, :event_id)
  end

end
