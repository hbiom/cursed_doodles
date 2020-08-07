class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = User.all
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_time, :ending_at)
  end
end
