require 'rails_helper'

RSpec.describe ::Api::V1::RegistrationsController, type: :controller do
  describe "POST #create" do
    let(:valid_user) { attributes_for(:user) }
    let(:invalid_user) { attributes_for(:user, email: nil) }
    
    context 'With valid attributes' do
      it 'Should be able to create a new user' do
        expect{ 
          post :create, params: { user: valid_user }
        }.to change(User, :count).by(1)
      end
    end
  end
end
