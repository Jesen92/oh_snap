module Api
  module V1
    module Mobile
      class UsersController < AuthorizationsController
        skip_before_action :authenticate_user_from_auth_token!, only: :create

        def create
          respond_with User.create(user_params), serializer: UserSerializer
        end

        def show
          respond_with current_user, serializer: UserSerializer
        end

        def edit
          respond_with current_user, serializer: UserSerializer
        end

        def update
          current_user.update(user_params)

          respond_with current_user, serializer: UserSerializer
        end

        private

        def user_params
          params.require(:user).permit(
              :username, :email, :password, :password_confirmation
          )
        end

      end
    end
  end
end
