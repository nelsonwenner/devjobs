require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'Associations' do
    it { should belong_to(:company) }
    it { should have_many(:applicant) }
  end
end
