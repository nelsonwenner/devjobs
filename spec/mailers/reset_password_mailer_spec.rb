require 'rails_helper'

RSpec.describe ResetPasswordMailer, type: :mailer do
  token = 'xxzwxcLYzD46K4RkJY0tchMZv0atSA9'
  email = 'test@email.com'
  default_from_email = 'noreply@company.com'
  let(:mail) { ResetPasswordMailer.call(email, token).deliver_now }

  before do
    mail.from = default_from_email
  end

  describe "ResetPasswordMailer #call" do
    context 'when attributes are renders' do
      it 'should be able to sender the email' do
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end
      
      it 'should be able to render the subject' do
        expect(mail.subject).to eq('Password Reset')
      end

      it 'should be able to render the email to' do
        expect(mail.to).to eq(['test@email.com'])
      end

      it 'should be able to render the email from' do
        expect(mail.from).to eq(['noreply@company.com'])
      end
    end
  end
end
