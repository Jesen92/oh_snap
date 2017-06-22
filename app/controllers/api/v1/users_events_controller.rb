module Api
  module V1
    class UsersEventsController < AuthorizationsController
      include ErrorsHelper
      before_action :authenticate_user_from_auth_token!

      def create
        #event = Event.find_by(access_code: create_user_event_params[:access_code])
        #(respond_with_error(400, user_event_error) and return) if event.blank?
        #UserEvent.create({:event_id => event.id, :user_id => current_user.id}) unless UserEvent.exists?({:event_id => event.id, :user_id => current_user.id})

        #respond_with event, serializer: EventSerializer
      end

      def index
        respond_with current_user.events
      end

      def show
      end

      private

      def create_user_event_params
        params.require(:event).permit(
            :access_code
        )
      end

      def user_event_error
        'Ups! Event sa upisanim kodom ne postoji! Provjerite da li ste dobro upisali kod i pokušajte ponovo!'
      end
    end
  end
end
