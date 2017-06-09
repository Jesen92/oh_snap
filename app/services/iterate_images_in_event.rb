class IterateImagesInEvent
  def initialize(params, event) #, last_image
    @current_image_id = params[:current_image_id]
    @last_image_id = params[:last_image_id]
    @event = event
  end

  def next_image_in_event
    find_next_image_in_event
  end

  def previous_image_in_event
    find_previous_image_in_event
  end

  private

  attr_reader :current_image_id, :event, :last_image_id

  def find_next_image_in_event
    #(event.images.where("id > ?", last_image.id).first and return) if event.images.last.id > last_image.id
    event.images.where("id > ?", current_image_id).order('id ASC').first || event.images.first
  end

  def find_previous_image_in_event
    event.images.where("id > ?", current_image_id).order('id ASC').first || event.images.last
  end

  def check_if_new_image_exists
     event.images.last.id > last_image_id
  end

end