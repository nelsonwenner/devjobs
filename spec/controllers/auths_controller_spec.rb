require 'rails_helper'

RSpec.describe ::Api::V1::AuthsController, type: :controller do
  # Shared concern Authable 
  it_behaves_like 'Authable', ::Api::V1::AuthsController

  context 'Authentication' do
    let(:user) { create(:user) }

    it 'Should accomplish login return a JSON with status success and logged_in true' do
      response = post :create, params: { 
        email: user.email, 
        password: '123456' 
      }
      expect(eval(response.body)).to eq({ 
        status: 'success', logged_in: true 
      })
    end

    it 'Should not accomplish login return a JSON with status error and logged_in false' do
      response = post :create, params: { 
        email: user.email, 
        password: '12345678' 
      }
      expect(eval(response.body)).to eq({ 
        status: 'error', logged_in: false 
      })
    end
    
    it 'Should verify it is connected return a JSON with current user logged_in true' do
      session[:user_id] = user.id
      response = get :logged_in, params: { 
        email: user.email, 
        password: '123456' 
      }
      expect(eval(response.body)).to eq({ 
        username: user.username, 
        email: user.email, 
        logged_in: true
      })
    end

    it 'Should accomplish logout return a json with and logged_in false' do
      session[:user_id] = user.id
      response = delete :logout, params: { 
        email: user.email, 
        password: '123456' 
      }
      expect(eval(response.body)).to eq({ logged_in: false })
    end
  end
end
