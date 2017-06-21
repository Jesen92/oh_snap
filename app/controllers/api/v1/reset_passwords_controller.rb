module Api
  module V1
    class ResetPasswordsController < AuthorizationsController
      include JsonApiResponders
      skip_before_action :authenticate_user_from_auth_token!, only: :create

      def create
        user = User.find_by(email: password_reset_params[:email])

        password_reset(user)
      end

      private

      def password_reset_params
        params.require(:user).permit(
            :email,
        )
      end

      def password_reset(user)
        #return render json: { "errors" => { "id" => ["Korisnik sa upisanim email-om ne postoji!"]}}.to_json, status: :bad_request unless user
        return respond_with_error(401, 'Korisnik sa upisanim e-mail-om ne postoji!') unless user

        if !user.reset_password_sent_at || user.reset_password_sent_at < 1.day.ago
          user.send_reset_password_instructions
          render json: { "user" => {detail:"Poslan je email sa instrukcijama za resetiranje lozinke"}}.to_json
        else
          #render json: { "errors" => { "id" => ["Lozinka se može resetirati samo 1 dnevno!"]}}.to_json, status: :bad_request
          respond_with_error(400, 'Lozinka se može resetirati samo 1 dnevno!')
        end
      end
    end
  end
end
