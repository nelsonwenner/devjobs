module Api
  module V1
    class ApplicantsController < ApiController
      before_action :authenticate

      def create
        @applicant = Applicant.new(**applicant_params,
          position_id: applicant_params[:position_id],
          user: current_user
        )

        if @applicant.save
          render status: 201, json: @applicant, serializer: ApplicantSerializer
        else
          render status: 400, json: errors(@applicant)
        end
      end

      private

      def applicant_params
        params.require(:applicant).permit(
          :name, :email, :phone, :curriculum, :position_id
        )
      end

      def errors(record)
        { errors: record.errors.messages }
      end
    end
  end
end
