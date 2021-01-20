module Authable
  extend ActiveSupport::Concern
  
  # Set action gives function current_user
  #
  included do
    before_action :current_user
  end

  # if not exists a session with this user-id, he returns nil.
  # If exists, search user through user-id stored a session,
  # and store in the global variable @current_user.
  #
  def current_user
    return nil unless session[:user_id]  
    @current_user ||= User.find(session[:user_id])
  end
  
  # If not exists a current_user return json.
  #
  def authenticate
    render json: { error: 'Access Denied' }, status: 401 unless current_user
  end
end
