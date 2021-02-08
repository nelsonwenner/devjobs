require "rails_helper"

RSpec.describe NotifyMailer, type: :mailer do
  describe "#reset_password_email" do
    token = 'xxzwxcLYzD46K4'
    email = 'test@email.com'

    let(:mail) { described_class.with(email: email, token: token).reset_password_email }

    it 'should be able to render the subject' do
      expect(mail.subject).to eq('Password Reset')
    end

    it 'should be able to render the email to' do
      expect(mail.to).to eq(['test@email.com'])
    end

    it 'should be able to render the email from' do
      expect(mail.from).to eq([ ENV["DEFAULT_FROM_EMAIL"] ])
    end

    it 'should be able to find the token' do
      expect(mail.html_part.body).to match(/#{token}/)
    end
  end
end
