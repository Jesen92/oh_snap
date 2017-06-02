module Api
  module V1
    module Mobile
      class UsersEventsController < AuthorizationsController
        before_action :authenticate_user_from_auth_token!

        def create
          event = Event.find_by(access_code: create_user_event_params[:access_code])
          (respond_with_error(400, 'Ups! Event sa upisanim kodom ne postoji! Provjerite da li ste dobro upisali kod i pokušajte ponovo!') and return) if event.blank?
          UserEvent.create({:event_id => event.id, :user_id => current_user.id}) unless UserEvent.exists?({:event_id => event.id, :user_id => current_user.id})

          respond_with event
        end

        def index
          render json: current_user.events.to_json
        end

        def show
        end

        private

        def create_user_event_params
          params.require(:event).permit(
            :access_code
          )
        end

      end
    end
  end
end
