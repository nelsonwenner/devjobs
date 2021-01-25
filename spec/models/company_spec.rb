require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:position) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_presence_of(:url).on(:create) }
    it { should validate_presence_of(:name).on(:update) }
    it { should validate_presence_of(:url).on(:update) }
  end
end
