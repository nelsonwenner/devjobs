require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_one(:company) }
    it { should have_many(:applicant) }
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:username).on(:create) }
    it { should validate_presence_of(:email).on(:create) }
    it { should validate_presence_of(:password).on(:create) }
  end
end
