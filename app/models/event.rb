class Event < ApplicationRecord
  has_many :users






  def start_event
    Date.new(self.start_time.strftime("%y").to_i , self.start_time.strftime("%m").to_i , self.start_time.strftime("%d").to_i)
  end

  def end_event
    Date.new(self.ending_at.strftime("%y").to_i , self.ending_at.strftime("%m").to_i , self.ending_at.strftime("%d").to_i)
  end

  def participants

    participants = Hash.new(0)

    self.users.each do |user|
      date_user = []
      (user.start..user.end).each do |date|
        date_user << date
      end

      (self.start_event..self.end_event).each do |item|
        date_user.include?(item) ? participants[item] += 1 : participants[item] += 0
      end
    end
    participants
  end

end
