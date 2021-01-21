module Api
  module V1
    class AuthsController < ApiController
      before_action :authenticate, only: [:logout]
      before_action :set_user, only: [:create]
      
      def create
        if @user && @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          render json: { status: :success, logged_in: true }, status: 204
        else
          render json: { status: :error, logged_in: false }, status: 400
        end
      end
      
      def logout
        reset_session

        render json: { logged_in: false }, status: 200
      end

      def logged_in
        if current_user
          render json: {
            username: current_user&.username,
            email: current_user&.email, 
            logged_in: true 
          }, status: 200
        else
          render json: { logged_in: false }, status: 200
        end
      end

      private

      def set_user
        @user = User.where(email: user_params[:email]).first! or not_found
      end

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
