require 'rails_helper'

RSpec.describe Api::V1::ApplicantsController, type: :controller do
  describe "POST #create" do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    let(:position) { create(:position, company_id: company.id) }
    let(:valid_applicant) { attributes_for(:applicant, position_id: position.id) }

    before do
      session[:user_id] = user.id
    end

    context 'when attributes are valid' do
      it 'Should be able to create a new applicant' do
        expect{ 
          post :create, params: { applicant: valid_applicant }
        }.to change(Applicant, :count).by(1)
      end
    end
  end
end
