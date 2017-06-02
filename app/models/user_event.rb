class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event, dependent: :destroy
end
