class ImagesController < ApplicationController
  before_action :set_event, only: [:index, :show, :destroy]

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

  def destroy
    image = Image.find(params[:image_id])
    #image.destroy! if is_admin? else flash[:notice] = "Niste admin eventa!"
    if is_admin?
      image.destroy!
      flash[:notice] = "Slika je obrisana"
    else
      flash[:notice] = "Niste admin eventa!"
    end

    redirect_to images_show_path(id: @event.id)
  end

  def users_images
    @images = current_user.images
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def is_admin?
    user_event = UserEvent.find_by(user_id: current_user.id, event_id: @event.id)

    user_event.blank? || !user_event.admin? ? false : true
  end

end
