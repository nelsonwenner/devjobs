module Api
  module V1
    class RegistrationsController < ApiController
      def create
        user = User.new(
          username: user_params[:username],
          email: user_params[:email],
          password: user_params[:password],
          password_confirmation: user_params[:password]
        )
        
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
