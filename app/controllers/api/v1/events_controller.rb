module Api
  module V1
    class EventsController < AuthorizationsController
      include ErrorsHelper
      before_action :set_event, only: [:show, :edit, :update, :destroy]

      def index
        events = Event.where(private: false)
        respond_with :api, :v1, events, serializer: EventSerializer, :on_error => { status: :bad_request, detail: 'Pogreška kod dohvaćanja svih event-a!' }
      end

      def show
        respond_with :api, :v1, @event, serializer: EventSerializer
      end

      def new
      end

      def edit
        #TODO provjera da li je user admin event-a
        if UserEvent.exists?(event_id: @event.id, user_id: current_user.id, admin: true)
          respond_with :api, :v1, @event, serializer: EventSerializer
        else
          respond_with_error(status: 401, detail: 'Nemate autorizaciju za izmjenu event-a')
        end
      end

      def create
        event = current_user.events.create(new_event_params)

        respond_with :api, :v1, event, serializer: EventSerializer, :on_error => { status: :bad_request, detail: 'Pogreška kod kreiranja event-a!' }
      end

      def update
        @event.update(event_params)

        respond_with :api, :v1, @event, serializer: EventSerializer, :on_error => {status: :bad_request, detail: 'Pogreška kod izmjene event-a!'}
      end

      def destroy
        if UserEvent.exists?(event_id: @event.id, user_id: current_user.id, admin: true)
          @event.destroy
          #TODO response za destroy event-a
          #render json: { :errors => [{ :detail => 'Nemate autorizaciju za brisanje event-a' }] }
        else
          respond_with_error(status: 401, detail: 'Nemate autorizaciju za brisanje event-a')
        end
      end

      def event_images
        #event = Event.find(params[:id])
        (respond_with_error(400, 'Korisnik nema pristup događaju') and return) unless @event.users.exists?(id: current_user.id)

        respond_with @event.images
      end

      private

      def set_event
        @event = Event.find_by(id: params[:id] || event_params[:id] )

        (return respond_with_error(:bad_request, 'Nije pronađen event!')) if @event.blank?
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def new_event_params
        params.require(:event).permit(:id, :name, :private, :user_id => current_user.id)
      end

      def event_parms
        params.require(:event).permit(:id, :name, :private)
      end
    end
  end
end
