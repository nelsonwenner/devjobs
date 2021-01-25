require 'rails_helper'

RSpec.describe ::Api::V1::RegistrationsController, type: :controller do
  describe "POST #create" do
    let(:invalid_user_password) { attributes_for(:user, password: nil) }
    let(:invalid_user_username) { attributes_for(:user, username: nil) }
    let(:invalid_user_email) { attributes_for(:user, email: nil) }
    let(:valid_user) { attributes_for(:user) }
    
    context 'when attributes are valid' do
      it 'Should be able to create a new user' do
        expect{ 
          post :create, params: { user: valid_user }
        }.to change(User, :count).by(1)
      end
    end

    context 'when attributes are invalid' do
      it {
        expect{ 
          post :create, params: { user: invalid_user_username }
        }.to change(User, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { user: invalid_user_email }
        }.to change(User, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { user: invalid_user_password }
        }.to change(User, :count).by(0)
      }
    end
  end
end
