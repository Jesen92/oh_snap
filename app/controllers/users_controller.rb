class UsersController < ApplicationController
  def user_events
    @events = current_user.events
  end

  def user_images
    @images = current_user.images
  end
end
