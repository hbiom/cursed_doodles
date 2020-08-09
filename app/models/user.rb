class User < ApplicationRecord
  belongs_to :event
  has_many :uptimes






 # user.uptimes.each do |start|
 #  startdate_user = Date.new(start.start_time.strftime("%y").to_i , start.start_time.strftime("%m").to_i , start.start_time.strftime("%d").to_i)
 #  enddate_user = Date.new(start.ending_at.strftime("%y").to_i , start.ending_at.strftime("%m").to_i , start.ending_at.strftime("%d").to_i)


  def start
    starting = ""
    self.uptimes.each do |start|
      starting = Date.new(start.start_time.strftime("%y").to_i , start.start_time.strftime("%m").to_i , start.start_time.strftime("%d").to_i)
    end
    return starting
  end

  def end
    ending = ""
    self.uptimes.each do |start|
      ending = Date.new(start.ending_at.strftime("%y").to_i , start.ending_at.strftime("%m").to_i , start.ending_at.strftime("%d").to_i)
    end
    return ending
  end

end



