class UptimesController < ApplicationController
  def new
    @uptime = Uptime.new
    @user = User.find(params[:user_id])
    @event = Event.where("id = '#{@user.event_id}'")

  end

  def create
    @user = User.find(params[:user_id])
    @uptime = Uptime.new(uptime_params)

    #@event = Event.where("id = '#{@user.event_id}'")
    @event = Event.find_by_id(@user.event_id)
    #@event = Event.find(params[@user.event_id])
    @uptime.user = @user

    if @uptime.save
      redirect_to event_path(@event)
    end
  end

  private

  def uptime_params
    params.require(:uptime).permit(:start_time, :ending_at)
  end
end
