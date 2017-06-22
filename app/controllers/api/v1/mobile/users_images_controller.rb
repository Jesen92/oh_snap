module Api
  module V1
    module Mobile
      class UsersImagesController < AuthorizationsController
        include ErrorsHelper

        def index
          respond_with current_user.images
        end

        def show
        end
      end
    end
  end
end

