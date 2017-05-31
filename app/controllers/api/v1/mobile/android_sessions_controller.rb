module Api
  module V1
    module Mobile
      class AndroidSessionsController < AuthorizationsController
        include Devise::Controllers::Helpers
        skip_before_action :authenticate_user_from_auth_token!, only: :create

        def create
          user = User.find_by(username: session_params[:identifier]) #|| User.find_by(phone_number: session_params[:identifier])

          if user && user.valid_password?(session_params[:password])
            user.regenerate_android_auth_token!

            respond_with user, serializer: UserSerializer
          else
            respond_with_create_session_error
          end
        end

        def destroy
          current_user.regenerate_android_auth_token!

          render json: {:user => "Korisnik se uspješno odjavio"}.to_json
        end

        private

        def session_params
          params.require(:user).permit(
              :identifier, :password
          )
        end

        def create_session_errors
          @auth_error_message ||= 'Ups! Upisali ste krivu lozinku ili email!'
          [ {detail: @auth_error_message}]
        end

        def respond_with_create_session_error
          render json: { errors: create_session_errors }, status: :bad_request
        end
      end
    end
  end
end
