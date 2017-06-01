class ImagesController < ApplicationController
  before_action :set_event

  def index
    @images = @event.images
  end

  def show
    @images = @event.images
    images_array = []

    @images.each do |image|
      images_array << { :src => image.path_to_image, :w => 1920, :h => 1080}
    end

    gon.images = images_array
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end



end
