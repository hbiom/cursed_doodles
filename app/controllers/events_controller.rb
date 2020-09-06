class EventsController < ApplicationController
  def new
    @event = Event.new
    session[:event_params] = {}
  end

  def create
    session[:event_params].deep_merge!(event_params) if event_params
    @event = Event.new(session[:event_params])

    @event.current_step = session["current_step"]

    @dates = params[:event][:start_time]

    if params["back_button"]
      @event.previous_step
    elsif @event.last_step?
      @event.save
    else
      @event.next_step
    end

    session["current_step"] = @event.current_step

    if @event.save
      flash[:notice] = 'event saved successfully'
      redirect_to create_orga_path(@event)
    else
      render "new"
      flash[:notice] = 'event was not saved yet.'
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.where("event_id = '#{@event.id}'")
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :note, :start_time, :ending_at)
  end
end





