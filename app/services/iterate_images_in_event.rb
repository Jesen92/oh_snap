class IterateImagesInEvent
  def initialize(current_image, event) #, last_image
    @current_image = current_image
    #@last_image = last_image
    @event = event
  end

  def next_image_in_event
    find_next_image_in_event
  end

  def previous_image_in_event
    find_previous_image_in_event
  end

  private

  attr_reader :current_image, :event#, :last_image

  def find_next_image_in_event
    #(event.images.where("id > ?", last_image.id).first and return) if event.images.last.id > last_image.id
    event.images.where("id > ?", current_image.id).order('id ASC').first || event.images.first
  end

  def find_previous_image_in_event
    event.images.where("id > ?", current_image.id).order('id ASC').first || event.images.last
  end

end