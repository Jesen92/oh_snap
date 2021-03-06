module Api
  module V1
    module Mobile
      class ApiController < ApplicationController
        include JsonApiResponders
        respond_to :json
        skip_before_action  :verify_authenticity_token, :authenticate_user!
        before_action :configure_permitted_parameters, if: :devise_controller?

        protected

        def configure_permitted_parameters
          added_attrs = [:username, :tel_number, :email, :password, :password_confirmation, :remember_me]
          devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
          devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end
      end
    end
  end
end
