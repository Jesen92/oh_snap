class UsersController < ApplicationController
  def user_events
    @events = current_user.events
  end

  def user_images
    @images = current_user.images

    @images_array = []

    @images.each do |image|
      image_size = FastImage.size(image.path_to_image)
      @images_array << { :id => image.id,:src => image.path_to_image,
                         :width => image_size[0], :height => image_size[1]}
    end
  end
end
