require 'rails_helper'

RSpec.shared_examples 'Authable' do
  describe '#logged_in' do
    describe 'When logged in' do
      it {
        session[:user_id] = 1
        expect(subject.logged_in?).to eq(true)
      }
    end
    
    describe "When logged out" do
      it {
        session[:user_id] = nil
        expect(subject.logged_in?).to eq(false)
      }
    end
  end
end
