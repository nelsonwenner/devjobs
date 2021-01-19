require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:position) }
  end
end
