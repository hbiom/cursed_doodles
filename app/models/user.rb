class User < ApplicationRecord
  belongs_to :event
  has_many :uptimes



  def start_event
    self.start_time.split(',').map(&:to_date)
  end


  # def start
  #   start = []
  #   self.uptimes.each do |date|
  #     # start = Date.new(date.start_time.strftime("%y").to_i , date.start_time.strftime("%m").to_i , date.start_time.strftime("%d").to_i)
  #     start << date.start_time.to_date
  #   end
  #   "" if start.empty?
  # end

  # def end
  #   ending = ""
  #   self.uptimes.each do |date|
  #     # ending = Date.new(date.ending_at.strftime("%y").to_i , date.ending_at.strftime("%m").to_i , date.ending_at.strftime("%d").to_i)
  #     ending = date.ending_at.to_date
  #   end
  #   ending
  # end

  def date_user
    dates_user = []
    self.uptimes.each do |dates|
      dates_user = dates.start_time.split(',').map(&:to_date)
    end
    dates_user
  end

end



