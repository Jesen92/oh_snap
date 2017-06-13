module Api
  module V1
    module Mobile
      class UsersController < AuthorizationsController
        include JsonApiResponders
        skip_before_action :authenticate_user_from_auth_token!, only: :create

        def create
          user = User.create(user_params)

          respond_with user, serializer: UserSerializer, on_error: {
              status: :bad_request, detail: 'Pogreška kod kreiranja korisnika! Username ili email već postoji!'
          }
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
              :username, :email, :password
          )
        end

      end
    end
  end
end
