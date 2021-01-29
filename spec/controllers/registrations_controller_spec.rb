require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do
  describe "POST #create" do
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
          post :create, params: { user: { **valid_user, username: nil } }
        }.to change(User, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { user: { **valid_user, email: nil } }
        }.to change(User, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { user: { **valid_user, password: nil } }
        }.to change(User, :count).by(0)
      }
    end
  end
end
