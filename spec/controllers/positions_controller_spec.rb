require 'rails_helper'

RSpec.describe ::Api::V1::PositionsController, type: :controller do
  describe "POST #create" do
    let(:user) { create(:user) }

    before do
      session[:user_id] = user.id
    end

    context 'when attributes are valid' do
      let(:company) { create(:company, user: user) }
      let(:career) { create(:career) }
      let(:valid_position) { attributes_for(
      :position, company_id: company.id, career_id: career.id) }

      it 'Should be able to create a new position' do
        expect{ 
          post :create, params: { position: valid_position }
        }.to change(Position, :count).by(1)
      end
    end
  end
end
