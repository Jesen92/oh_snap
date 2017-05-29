module Api
  module V1
    module Mobile
      class AuthorizationsController < ApiController
        include Devise::Controllers::Helpers

        before_action :authenticate_user_from_auth_token!

        def authenticate_user_from_auth_token!
          user = authenticate_with_http_token do |token, options|
            user = User.find_by(username: options['identifier']) #|| User.find_by(phone_number: options['identifier'])
            user if Devise.secure_compare(token, user.android_auth_token) unless user.blank?
          end

          (respond_with_auth_error and return) if user.blank? #Korisnik ne postoji ili se ne poklapa autentifikacijski token

          # devise, daje ti current_user metodu
          sign_in(user, store: false)
        end

        ######################## Sign in error
        def auth_errors
          @auth_error_message ||= 'Molimo ulogirajte se da bi se zadana naredba izvršila!'
          { id:[ @auth_error_message], detail: 'not authenticated' }
        end

        def respond_with_auth_error
          render json: { errors: auth_errors }, status: :unauthorized
        end
        ########################
      end
    end
  end
end
