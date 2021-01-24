require 'rails_helper'

RSpec.describe ::Api::V1::CompaniesController, type: :controller do
  describe "POST #create" do
    let(:valid_company) { attributes_for(:company) }
    let(:user) { create(:user) }

    before do
      session[:user_id] = user.id
    end

    context 'With valid attributes' do
      it 'Should be able to create a new company' do
        expect{ 
          post :create, params: { company: valid_company }
        }.to change(Company, :count).by(1)
      end
    end
  end
end
