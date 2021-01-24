module Api
  module V1
    class CompaniesController < ApiController
      before_action :authenticate, only: [:create]
      
      def create
        @company = Company.new(
          name: company_params[:name],
          url: company_params[:url],
          brand: params[:brand],
          user: current_user
        )

        if @company.save
          render status: 201, json: serializer(@company)
        else
          render status: 400, json: errors(@company)
        end
      end

      private
      
      def company_params
        params.require(:company).permit(:name, :url)
      end

      def serializer(records, options = {})
        CompanySerializer
          .new(records, options)
          .serialized_json
      end

      def errors(record)
        { errors: record.errors.messages }
      end
    end
  end
end
