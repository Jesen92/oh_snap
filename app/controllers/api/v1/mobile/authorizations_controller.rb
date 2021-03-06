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

          (respond_with_error(401, auth_error_message) and return) if user.blank? #Korisnik ne postoji ili se ne poklapa autentifikacijski token

          # devise, daje ti current_user metodu
          sign_in(user, store: false)
        end

        def auth_error_message
          'Molimo ulogirajte se da bi se zadana naredba izvršila'
        end
      end
    end
  end
end
