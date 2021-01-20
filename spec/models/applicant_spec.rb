require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:position) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_presence_of(:email).on(:create) }
    it { should validate_presence_of(:phone).on(:create) }
  end
end
