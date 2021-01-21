require 'rails_helper'

RSpec.describe ::Api::V1::AuthsController, type: :controller do
  # Shared concern Authable 
  it_behaves_like 'Authable', ::Api::V1::AuthsController

  context 'Authentication' do
    let(:user) { create(:user) }
    
    it 'Should return a json with status sucess and logged_in true' do
      response = post :create, params: { 
        email: user.email, 
        password: '123456' 
      }
      expect(eval(response.body)).to eq({ 
        status: 'success', logged_in: true 
      })
    end
  end
end
