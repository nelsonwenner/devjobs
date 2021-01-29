require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'Associations' do
    it { should belong_to(:company) }
    it { should have_many(:applicant) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:career) }
    it { should validate_presence_of(:contract) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:description) }
  end
end
