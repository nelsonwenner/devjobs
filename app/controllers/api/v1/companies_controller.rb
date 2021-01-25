module Api
  module V1
    class CompaniesController < ApiController
      before_action :set_company, only: [:show, :update]
      before_action :authenticate
      
      def show
        render status: 200, json: serializer(@company)
      end
      
      def create
        @company = Company.new(
          name: company_params[:name],
          url: company_params[:url],
          brand: company_params[:brand],
          user: current_user
        )
        
        if @company.save
          render status: 201, json: serializer(@company)
        else
          render status: 400, json: errors(@company)
        end
      end
      
      def update
        if @company.update(company_params)
          render json: serializer(@company)
        else
          render status: 422, json: errors(@company)
        end
      end
      
      private
      
      def set_company
        @company = Company.find(params[:id]) or not_found
      end
      
      def company_params
        params.require(:company).permit(:name, :url, :brand)
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
