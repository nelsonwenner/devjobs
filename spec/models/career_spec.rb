require 'rails_helper'

RSpec.describe Career, type: :model do
  describe 'Associations' do
    it { should have_many(:position) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
  end
end
