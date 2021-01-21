require 'rails_helper'

RSpec.describe ::Api::V1::AuthsController, type: :controller do
  # Shared concern Authable 
  it_behaves_like 'Authable', ::Api::V1::AuthsController
end
