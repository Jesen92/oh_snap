module Api
  module V1
    module Mobile
      class UsersController < AuthorizationsController
        include ErrorsHelper
        respond_to :json
        skip_before_action :authenticate_user_from_auth_token!, only: :create

        def create
          user = User.create(user_params)

          respond_with :api, :v1, :mobile, user, serializer: ::Mobile::UserAndroidSessionSerializer,
                       :on_error => { status: :bad_request, detail: 'Pogreška kod kreiranje novog korisnika!' }
        end

        def show
          respond_with :api, :v1, :mobile,  current_user,
                       serializer: ::Mobile::UserAndroidSessionSerializer
        end

        def edit
          respond_with :api, :v1, :mobile,  current_user,
                       serializer: ::Mobile::UserAndroidSessionSerializer
        end

        def update
          current_user.update(user_params)

          respond_with :api, :v1, :mobile, current_user,
                       serializer: ::Mobile::UserAndroidSessionSerializer
        end

        private

        def user_params
          params.require(:user).permit(
              :username, :email, :password
          )
        end
      end
    end
  end
end
