class UptimesController < ApplicationController

  def new
    @uptime = Uptime.new
    @user = User.find(params[:user_id])
    @event = Event.where("id = '#{@user.event_id}'")
  end

  def create
    @user = User.find(params[:user_id])
    @event = Event.find(@user.event_id)

    if @user.role == "Organisator"
      @uptime = Uptime.create(start_time: @event.start_time)
    else
      @uptime = Uptime.new(uptime_params)
    end

    @uptime.user = @user

    if @uptime.save
      redirect_to event_path(@event)
    end
  end

  private

  def uptime_params
    params.require(:uptime).permit(:start_time)
  end
end
