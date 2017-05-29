class Event < ApplicationRecord
  has_many :images

  has_many :user_events
  has_many :events, :through => :user_events
end
