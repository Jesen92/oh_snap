class Event < ApplicationRecord
  require 'securerandom'

  #has_attached_file :qr_code, styles: { medium: "300x300>", thumb: "100x100>" }

  has_many :images

  has_many :user_events
  has_many :users, :through => :user_events

  validates :name, presence: true, uniqueness: true

  before_create {
    loop do
      self.access_code = SecureRandom.hex(8)
      break unless Event.exists?(access_code: access_code)
    end
  }
end
