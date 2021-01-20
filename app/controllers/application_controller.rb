class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  protect_from_forgery with: :exception
  
  def not_found(exception)
    render status: 404, json: {errors: exception.model + ' not found' }.to_json
  end
end
