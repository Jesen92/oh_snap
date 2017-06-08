class ImagesController < ApplicationController
  before_action :set_event, only: [:index, :show, :destroy]
  layout 'blank', only: :index

  def index

    @images ||= @event.images
    current_image_id ||= params[:current_image] || @images.last.id
    current_image = Image.find(current_image_id)
    get_next_image = IterateImagesInEvent.new( current_image, @event )
    @image = get_next_image.next_image_in_event

    gon.event ||= @event.id
    gon.last_image ||= @images.last.id
    gon.current_image = @image.id
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

  def next_image_in_event
    Item.where("id > ?", id).order("id ASC").first || Item.first
  end

  def previous_image_in_event
    Item.where("id < ?", id).order("id DESC").first || Item.last
  end

end
