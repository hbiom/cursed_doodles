class PagesController < ApplicationController

  def home
    # @event = Event.new
    # @event = Event.new(event_params)
    # @event.save
    # @events = Event.all
    #@thesis = Event.where(name: 'Soutenance de thése')

    @thesis = Event.find_by(name: 'Soutenance de thése')

  end

  # def event_params
  #   params.require(:event).permit(:name, :place, :start_at, :ending_at)
  # end


end
