class User < ApplicationRecord
  belongs_to :event
  has_many :uptimes

  def start
    start = ""
    self.uptimes.each do |date|
      start = Date.new(date.start_time.strftime("%y").to_i , date.start_time.strftime("%m").to_i , date.start_time.strftime("%d").to_i)
    end
    start
  end

  def end
    ending = ""
    self.uptimes.each do |date|
      ending = Date.new(date.ending_at.strftime("%y").to_i , date.ending_at.strftime("%m").to_i , date.ending_at.strftime("%d").to_i)
    end
    ending
  end


end



