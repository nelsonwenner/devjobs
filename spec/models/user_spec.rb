require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_one(:company) }
    it { should have_many(:applicant) }
  end
end
