module Api
  module V1
    class RegistrationsController < ApiController
      def create
        user = User.new(
          email: user_params[:email],
          password: user_params[:password],
          password_confirmation: user_params[:password]
        )
        
        if user.save
          session[:user_id] = user.id
          render json: { status: :success, logged_in: true }, status: 204
        else
          render json: { status: :error, logged_in: false }, status: 422
        end
      end
      
      private
    
      def user_params
        params.require(:user).permit(
          :email, :password, 
          :password_confirmation
        )
      end
    end
  end
end
