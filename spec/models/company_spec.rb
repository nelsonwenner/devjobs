require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:position) }
  end
end
