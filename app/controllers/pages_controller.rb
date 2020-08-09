class PagesController < ApplicationController

  def home
    # @event = Event.new
    # @event = Event.new(event_params)
    # @event.save
    @events = Event.all
  end

  # def event_params
  #   params.require(:event).permit(:name, :place, :start_at, :ending_at)
  # end


end
