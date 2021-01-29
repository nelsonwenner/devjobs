module Api
  module V1
    class PositionsController < ApiController
      before_action :set_position, only: [:show, :update]
      before_action :authenticate, only: [:create, :update]

      def index
        render status: 200, json: positions, each_serializer: PositionSerializer
      end

      def show
        render status: 200, json: @position, serializer: PositionSerializer
      end

      def create
        @position = Position.new(position_params)

        if @position.save
          render status: 201, json: @position, serializer: PositionSerializer
        else
          render status: 400, json: errors(@position)
        end
      end

      def update
        if @position.update(position_params_update)
          render status: 200, json: @position, serializer: PositionSerializer
        else
          render status: 422, json: errors(@position)
        end
      end

      private

      def positions
        @positions ||= Position.all
      end

      def set_position
        @position = Position.where(slug: params[:slug]).first! or not_found
      end

      def position_params
        params.require(:position).permit(
          :name, :contract, :remote, :country, 
          :state, :city, :summary, :description, :publish,
          :company_id, :career_id
        )
      end

      def position_params_update
        params.require(:position).permit(
          :name, :contract, :remote, :country, 
          :state, :city, :summary, :description, :publish
        )
      end
      
      def errors(record)
        { errors: record.errors.messages }
      end
    end
  end
end
