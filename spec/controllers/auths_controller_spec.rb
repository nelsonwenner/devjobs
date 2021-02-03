require 'rails_helper'

RSpec.describe Api::V1::AuthsController, type: :controller do
  # Shared concern Authable 
  it_behaves_like 'Authable', Api::V1::AuthsController
  
  describe 'POST #create' do
    let(:user) { create(:user) }

    describe 'When authentication is valid' do
      it 'Should be able to authenticate' do
        response = post :create, params: { 
          user: {
            email: user.email, 
            password: '123456'
          } 
        }
        expect(eval(response.body)).to eq({ 
          status: 'success', logged_in: true 
        })
      end
    end
    
    describe 'When authentication is invalid' do
      it 'Should not be able to find user' do
        response = post :create, params: { 
          user: {
            email: 'invalid@email.com', 
            password: '123456'
          } 
        }
        expect(eval(response.body)).to eq({errors: 'User not found'})
      end

      it 'Should not be able to log in' do
        response = post :create, params: { 
          user: {
            email: user.email, 
            password: '12345678'
          } 
        }
        expect(eval(response.body)).to eq({ 
          status: 'error', logged_in: false 
        })
      end
    end
  end

  describe 'GET #logged_in' do
    let(:valid_user_attr) { attributes_for(:user) }
    let(:user) { create(:user) }

    describe 'When authentication' do
      it 'Should be able to verify if it is log in' do
        session[:user_id] = user.id
        response = get :logged_in, params: { user: valid_user_attr }
        expect(eval(response.body)).to eq({ 
          username: user.username, 
          email: user.email, 
          logged_in: true
        })
      end
    end
  end
  
  describe "DELETE #logout" do
    let(:user) { create(:user) }
    
    describe 'When logout' do
      it 'Should be able to log out' do
        session[:user_id] = user.id
        response = delete :logout
        expect(eval(response.body)).to eq({ logged_in: false })
      end
    end
  end

  describe 'POST #forgot_password' do
    let(:user) { create(:user) }

    describe 'When attributes are valid' do
      it 'Should be able to redefine password with success' do
        response = post :forgot_password, params: { email: user.email }
        expect(eval(response.body)).to eq({ success: true })
        expect(response.status).to equal(200)
      end
    end

    describe 'When attributes are invalid' do
      it 'Should not be able to redefine password with success' do
        response = post :forgot_password, params: { email: nil }
        expect(eval(response.body)).to eq({ error: 'Something went wrong.' })
        expect(response.status).to equal(422)
      end
    end
  end
end
