module Api
  module V1
    class CompaniesController < ApiController
      before_action :set_company, only: [:show, :update]
      before_action :authenticate
      
      def show
        render status: 200, json: @company, serializer: CompanySerializer
      end
      
      def create
        @company = Company.new(
          name: company_params[:name],
          url: company_params[:url],
          brand: company_params[:brand],
          user: current_user
        )
        
        if @company.save
          render status: 201, json: @company, serializer: CompanySerializer
        else
          render status: 400, json: errors(@company)
        end
      end
      
      def update
        if @company.update(company_params)
          render json: @company, serializer: CompanySerializer
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
      
      def errors(record)
        { errors: record.errors.messages }
      end
    end
  end
end
