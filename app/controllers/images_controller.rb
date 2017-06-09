class ImagesController < ApplicationController
  before_action :set_event, only: [:index, :show, :destroy]
  layout 'blank', only: :index

  def index
    @image = IterateImagesInEvent.new( iterate_image_hash, @event ).next_image_in_event

    gon.image_hash = images_hash_for_js
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

  def images_hash_for_js
    {:event => @event.id, :last_image => @event.images.last.id, :previous_image => params[:current_image], :current_image => @image.id}
  end

  def iterate_image_hash
    {:current_image_id => params[:current_image], :last_image_id => params[:last_image]}
  end

end
