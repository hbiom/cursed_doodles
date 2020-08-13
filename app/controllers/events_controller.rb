class EventsController < ApplicationController
  def new
    @event = Event.new
    session[:order_params] = {}
  end

  def create
    @event = Event.new(event_params)
    @event.current_step = session["current_step"]
    if params["back_button"]
      @event.previous_step
    else
      @event.next_step
    end
    session["current_step"] = @event.current_step
    render "new"
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


# https://www.youtube.com/watch?v=W9aMzGF60Lw
