require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'Associations' do
    it { should belong_to(:company) }
    it { should belong_to(:career) }
    it { should have_many(:applicant) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_presence_of(:contract).on(:create) }
    it { should validate_presence_of(:remote).on(:create) }
    it { should validate_presence_of(:country).on(:create) }
    it { should validate_presence_of(:state).on(:create) }
    it { should validate_presence_of(:city).on(:create) }
    it { should validate_presence_of(:summary).on(:create) }
    it { should validate_presence_of(:description).on(:create) }
    it { should validate_presence_of(:publish).on(:create) }
  end
end
