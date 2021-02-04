require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  describe 'Associations' do
    it { should have_one(:company) }
    it { should have_many(:applicant) }
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:username).on(:create) }
    it { should validate_presence_of(:email).on(:create) }
    it { should validate_presence_of(:password).on(:create) }
  end

  describe '#generate_password_token' do
    it 'Should be able to generate a password token' do
      expect(user.generate_password_token!).to equal(true)
    end
  end
end
