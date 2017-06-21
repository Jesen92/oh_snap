module Api
  module V1
    class UsersImagesController < AuthorizationsController
      include JsonApiResponders
      before_action :authenticate_user_from_auth_token!

      def index
        respond_with current_user.images
      end
    end
  end
end