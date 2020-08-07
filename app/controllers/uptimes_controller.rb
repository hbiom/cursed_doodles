class UptimesController < ApplicationController
  def new
    @uptime = Uptime.new
  end

  def create
    @uptime = Uptime.new(uptime_params)
    @user = User.find(id)
    @uptime.save
  end

  private

  def uptime_params
    params.require(:uptime).permit(:start_time, :ending_at)
  end
end
