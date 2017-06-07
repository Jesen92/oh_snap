module Api
  module V1
    module Mobile
      class ImagesController < AuthorizationsController
        before_action :authenticate_user_from_auth_token!, :set_user_event!

        def create
          image = @event.images.create(image_hash)

          #respond_with @event, serializer: EventSerializer, :on_error => { status: :bad_request, detail: 'Pogreška kod spremanja slike!' }
          respond_with image, serializer: ImageSerializer, :on_error => { status: :bad_request, detail: 'Pogreška kod spremanja slike!' }
        end

        private

        def set_user_event!
          @event = Event.find(image_params[:event_id])
          (respond_with_error(400, 'Događaj ne postoji ili korisnik nema pristup događaju') and return) if @event.blank? or !@event.users.exists?(id: current_user.id)
        end

        def image_params
          params.require(:image).permit(
            :event_id, :path_to_image
          )
        end

        def image_hash
          {:event_id => @event.id, :user_id => current_user.id, :path_to_image => image_params[:path_to_image]}
        end

      end
    end
  end
end

