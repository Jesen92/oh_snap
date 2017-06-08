class Image < ApplicationRecord
  #belongs_to :user
  belongs_to :event
  belongs_to :user

  validates :path_to_image, presence: true, allow_nil: false #,uniqueness: true

end
