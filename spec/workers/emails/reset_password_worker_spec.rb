require "rails_helper"

RSpec.describe Emails::ResetPasswordWorker, type: :worker do
  token = 'xxzwxcLYzD46K4'
  email = 'test@email.com'

  let(:worker) { subject }
  let(:mailer_mock) { double }
  let(:message_delivery_mock) { double }

  before do
    allow(NotifyMailer).to receive(:with).with(email: email, token: token).and_return(mailer_mock)
    allow(mailer_mock).to receive(:reset_password_email).and_return(message_delivery_mock)
    allow(message_delivery_mock).to receive(:deliver_now)
  end

  include_examples '#enqueues_on_correct_queue', 'default'
  
  describe '#perform' do
    it 'should be able to send an email to reset the password' do
      worker.perform(email, token)
      expect(NotifyMailer).to have_received(:with).with(email: email, token: token)
      expect(mailer_mock).to have_received(:reset_password_email)
      expect(message_delivery_mock).to have_received(:deliver_now)
    end
  end
end
