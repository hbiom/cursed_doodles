class EventsController < ApplicationController
  def new
    @event = Event.new
    session[:event_params] = {}
  end

  def create
    session[:event_params].deep_merge!(event_params) if event_params
    @event = Event.new(session[:event_params])

    @event.current_step = session["current_step"]

    if params["back_button"]
      @event.previous_step
    elsif @event.last_step?
      @event.save
    else
      @event.next_step
    end

    session["current_step"] = @event.current_step
    #redirect_to new_event_user_path(@event)

    # #raise
    # if @event.new_record?
    # else
    # end

    if @event.save
      flash[:notice] = 'event saved successfully'
      redirect_to new_event_user_path(@event)
    else
      render "new"
      flash[:notice] = 'User was not saved yet.'
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


# https://www.youtube.com/watch?v=W9aMzGF60Lw
