class Event < ApplicationRecord
  has_many :users

  attr_writer :current_step

  validates :start_time, presence: true
  validates :ending_at,  presence: true


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
        if date_user.empty?
          participants[item] = 0
        else
          date_user.include?(item) ? participants[item] += 1 : participants[item] += 0
        end
      end
    end
    participants
  end

  def steps
    %w[name time]
  end

  def current_step
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end


  def first_step?
    self.current_step == steps.first
  end

  def last_step?
    self.current_step == steps.last
  end
end
