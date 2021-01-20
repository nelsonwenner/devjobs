require 'rails_helper'

RSpec.describe Authable, type: :controller do
  before do
    class FakesController < ApplicationController
      include Authable
    end
  end

  after do
    Object.send :remove_const, :FakesController 
  end

  let(:user) { create(:user) }
  let(:object) { FakesController.new }

  it "Should exist a variable with name current-user" do
    puts object
  end
end
