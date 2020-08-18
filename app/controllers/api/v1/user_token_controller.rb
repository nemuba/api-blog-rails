module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      skip_before_action :verify_authenticity_token, raise: false

      private
      def auth_params
          params.require(:auth).permit(:email, :password)
      end
    end
  end
end