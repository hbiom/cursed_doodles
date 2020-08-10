class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to create_orga_path(@event)
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.where("event_id = '#{@event.id}'")
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_time, :ending_at)
  end
end
