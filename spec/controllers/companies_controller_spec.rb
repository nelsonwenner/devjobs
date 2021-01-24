require 'rails_helper'

RSpec.describe ::Api::V1::CompaniesController, type: :controller do
  describe "POST #create" do
    let(:valid_company) { attributes_for(:company) }
    let(:invalid_company_name) { attributes_for(:company, name: nil) }
    let(:invalid_company_url) { attributes_for(:company, url: nil) }
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

    context 'With invalid attributes' do
      it {
        expect{ 
          post :create, params: { company: invalid_company_name }
        }.to change(Company, :count).by(0)
      }
      it {
        expect{ 
          post :create, params: { company: invalid_company_url }
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

    context 'With valid slug' 
      it 'Should be able to get one resource' do
        response = get :show, params: { slug: company.slug }
        expect(assigns(:company)).to be_a(Company)
        expect(response.status).to equal(200)
    end
    
    context 'With invalid slug' 
    it 'Should not be able to get one resource' do
      response = get :show, params: { slug: 'test-slug' }
      expect(response.status).to equal(404)
    end
  end
end
