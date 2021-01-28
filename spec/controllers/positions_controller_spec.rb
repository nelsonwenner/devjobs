require 'rails_helper'

RSpec.describe ::Api::V1::PositionsController, type: :controller do
  describe "POST #create" do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    let(:career) { create(:career) }
    let(:valid_position) { attributes_for(
      :position, company_id: company.id, career_id: career.id) }

    before do
      session[:user_id] = user.id
    end

    context 'when attributes are valid' do
      it 'Should be able to create a new position' do
        expect{ 
          post :create, params: { position: valid_position }
        }.to change(Position, :count).by(1)
      end
    end

    context 'when attributes are invalid' do
      it {
        expect{ 
          post :create, params: { position: { **valid_position, name: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, contract: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, country: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, state: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, city: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, summary: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, description: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, company_id: nil } }
        }.to change(Position, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { position: { **valid_position, career_id: nil } }
        }.to change(Position, :count).by(0)
      }
    end
  end

  describe "GET #index" do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    let(:career) { create(:career) }

    context 'when request positions' do
      it 'Should have a position list' do
        create(:position, company_id: company.id, career_id: career.id)
        get :index 
        expect(response.status).to equal(200)
        expect(response.body).not_to be_empty
        expect(eval(response.body).length()).to equal(1)
      end
    end
  end

  context 'GET #show' do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    let(:career) { create(:career) }
  
    context 'when request one positions' do
      let(:position) { create(:position, 
        company_id: company.id, career_id: career.id) 
      }
      
      it 'Should have one position with slug valid' do
        get :show, params: { slug: position.slug }
        expect(response.status).to equal(200)
      end
    end
  end
end
