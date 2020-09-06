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
      if @user.role == "Organisator"
        @uptime = Uptime.create!(start_time: @event.start_time, user: @user)
        @uptime.start_time = @event.start_time
        if @uptime.save
          redirect_to event_path(@event)
        end
      else
        @uptime = Uptime.create!(start_time: @event.start_time, user: @user)
        if @uptime.save
          redirect_to event_path(@event)
        end
      end
    end
  end

  def create_orga
    @event = Event.find(params[:id])
    @user = User.new
    @user.event = @event
    @user = User.new(user_params_orga)
    @user.role = "Organisator"

    if @user.save
      define_uptime(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end

  def user_params_orga
    params.permit(:user).permit(:name, :role)
  end

  def uptime_params
    params.permit(:start_time, :user)
  end





  def define_uptime(user)
    if user.role == "Organisator"
      @uptime = Uptime.create!(start_time: @event.start_time, user: user)
      @uptime.start_time = @event.start_time
    else
      @uptime = Uptime.new(uptime_params)
    end
  end

end
