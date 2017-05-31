class ImagesController < ApplicationController
  before_action :set_event

  def index
    @images = @event.images
  end

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
