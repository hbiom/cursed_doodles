class User < ApplicationRecord
  belongs_to :events
  has_many :uptimes
end

