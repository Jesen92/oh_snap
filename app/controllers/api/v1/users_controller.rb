module Api
  module V1
    class UsersController < AuthorizationsController
      include ErrorsHelper
      skip_before_action :authenticate_user_from_auth_token!, only: :create

      def create
        user = User.create(user_params)

        respond_with :api, :v1, user, serializer: UserSerializer
      end

      def show
        respond_with :api, :v1, current_user, serializer: UserSerializer
      end

      def edit
        respond_with :api, :v1, current_user, serializer: UserSerializer
      end

      def update
        current_user.update(user_params)

        respond_with :api, :v1, current_user, serializer: UserSerializer
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
