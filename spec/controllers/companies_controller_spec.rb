require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  describe "POST #create" do
    let(:valid_company) { attributes_for(:company) }
    let(:user) { create(:user) }

    before do
      session[:user_id] = user.id
    end

    context 'when attributes are valid' do
      it 'Should be able to create a new company' do
        expect{ 
          post :create, params: { company: valid_company }
        }.to change(Company, :count).by(1)
      end
    end

    context 'when attributes are invalid' do
      it {
        expect{ 
          post :create, params: { company: { **valid_company, name: nil } }
        }.to change(Company, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { company: { **valid_company, url: nil } }
        }.to change(Company, :count).by(0)
      }
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }
    
    before do
      session[:user_id] = user.id
    end
    
    context 'when attributes are valid' do
      it 'Should be able to get one resource' do
        response = get :show, params: { id: company.id }
        expect(assigns(:company)).to be_a(Company)
        expect(response.status).to equal(200)
      end
    end
    
    context 'when attributes are invalid' do
      it 'Should not be able to get one resource' do
        response = get :show, params: { id: -1 }
        expect(response.status).to equal(404)
      end
    end
  end

  describe "PUT #update" do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }

    before do
      session[:user_id] = user.id
    end

    context 'when attributes are valid' do
      let(:valid_company) { attributes_for(:company) }
      
      it {
        response = put :update, params: { 
          id: company.id, company: valid_company 
        }
        expect(
          eval(response.body)[:name]
        ).to eq(valid_company[:name])
        expect(
          eval(response.body)[:url]
        ).to eq(valid_company[:url])
      }
    end
    
    context 'when attributes are invalid' do
      let(:valid_company) { attributes_for(:company) }
      
      it 'with invalid name' do 
        response = put :update, params: { 
          id: company.id, company: { **valid_company, name: nil }
        }
        expect(eval(response.body)).to eq({
          'errors':{'name':["can't be blank"]}
        })
      end

      it 'with invalid url' do 
        response = put :update, params: { 
          id: company.id, company: { **valid_company, url: nil }
        }
        expect(eval(response.body)).to eq({
          'errors':{'url':["can't be blank"]}
        })
      end
    end
  end
end
