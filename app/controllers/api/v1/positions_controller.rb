module Api
  module V1
    class PositionsController < ApiController
      before_action :authenticate, only: [:create]

      def create
        @position = Position.new(position_params)
        
        if @position.save
          render status: 201, json: serializer(@position)
        else
          render status: 400, json: errors(@position)
        end
      end

      private

      def position_params
        params.require(:position).permit(
          :name, :career, :contract, :remote, :country, 
          :state, :city, :summary, :description, :publish,
          :company_id, :career_id
        )
      end

      def serializer(records, options = {})
        PositionSerializer
          .new(records, options)
          .serialized_json
      end
      
      def errors(record)
        { errors: record.errors.messages }
      end
    end
  end
end
