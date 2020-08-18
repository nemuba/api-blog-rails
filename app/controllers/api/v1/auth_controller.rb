module Api
  module V1
    class AuthController < ApiController
      before_action :authenticate_user
    
      def current
        @user = current_user
        render json: @user
      end
    end
  end
end