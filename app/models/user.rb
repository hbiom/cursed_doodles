class User < ApplicationRecord
  belongs_to :event
  has_many :uptimes

  def start_event
    self.start_time.split(',').map(&:to_date)
  end

  def date_user
    dates_user = []
    self.uptimes.each do |dates|
      dates_user = dates.start_time.split(',').map(&:to_date)
    end
    dates_user
  end
end

