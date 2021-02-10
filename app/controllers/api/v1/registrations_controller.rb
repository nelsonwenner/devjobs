module Api
  module V1
    class RegistrationsController < ApiController
      def create
        user = User.new(user_params)
        
        if user.save
          render json: { status: :success }, status: 204
        else
          render json: { status: :error }, status: 422
        end
      end

      private
      
      def user_params
        params.require(:user).permit(
          :username, :email, :password, 
          :password_confirmation
        )
      end
    end
  end
end
