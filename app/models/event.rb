class Event < ApplicationRecord
  has_many :users






  def start_event
    Date.new(self.start_time.strftime("%y").to_i , self.start_time.strftime("%m").to_i , self.start_time.strftime("%d").to_i)
  end

  def end_event
    Date.new(self.ending_at.strftime("%y").to_i , self.ending_at.strftime("%m").to_i , self.ending_at.strftime("%d").to_i)
  end

end
