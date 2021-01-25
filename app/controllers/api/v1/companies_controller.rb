module Api
  module V1
    class CompaniesController < ApiController
      before_action :set_company, only: [:show]
      before_action :authenticate
      
      def show
        render status: 200, json: serializer(@company)
      end
      
      def create
        @company = Company.new(
          name: company_params[:name],
          url: company_params[:url],
          brand: params[:company][:brand],
          user: current_user
        )
        
        if @company.save
          render status: 201, json: serializer(@company)
        else
          render status: 400, json: errors(@company)
        end
      end
      
      private
      
      def set_company
        @company = Company.find(params[:id]) or not_found
      end
      
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
