class Event < ApplicationRecord
  has_many :users


  #has_many :start_time

  attr_writer :current_step

  validates :start_time, presence: true
  # validates :ending_at,  presence: true

  # def start_event
  #   Date.new(self.start_time.strftime("%y").to_i , self.start_time.strftime("%m").to_i , self.start_time.strftime("%d").to_i)
  # end

  # def end_event
  #   Date.new(self.ending_at.strftime("%y").to_i , self.ending_at.strftime("%m").to_i , self.ending_at.strftime("%d").to_i)
  # end

  def start_event
    self.start_time.split(',').map(&:to_date)
  end

  def range_event
    date_array = self.start_time.split(',').map(&:to_date)
    return date_array.min..date_array.max
  end


  def date_pick
    dates = []
    self.start_time.each do |date|
      dates << date
    end
  end

  def number_user
    self.users.count
  end

  def participants
    participants = Hash.new(0)

    self.users.each do |user|
      self.start_event.each do |item|
        unless user
          participants[item] = 0
        else
          user.date_user.include?(item) ? participants[item] += 1 : participants[item] += 0
        end
      end
    end
    participants
  end

  def define_date_for_user
    dates_event = self.participants
    dates = []
    dates_event.each do |date, number_participant|

      if self.number_user == 2
        if [true, true, false].sample
          dates << date
        end

      elsif number_participant != (self.number_user - 1)
        if [true, true, false].sample
          dates << date
        end
      end
    end
    dates.join(', ')
  end

# form in several steps
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
