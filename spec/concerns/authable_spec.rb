require 'rails_helper'

RSpec.shared_examples 'Authable' do
  it "should return true if user is logged in" do
    session[:user_id] = 1
    expect(subject.logged_in?).to eq(true)
  end
  
  it "should return false if user is not logged in" do
    expect(subject.logged_in?).to eq(false)
  end
end
