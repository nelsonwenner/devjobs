require 'rails_helper'

RSpec.describe ResetPasswordMailer, type: :mailer do
  token = 'xxzwxcLYz/D46K4RkJY0tchMZv0atSA9'
  email = 'test@email.com'
  let(:mail) { ResetPasswordMailer.call(email, token).deliver_now }

  describe "ResetPasswordMailer #call" do
    context 'when attributes are renders' do
      it 'should be able to render the subject' do
        expect(mail.subject).to eq('Password Reset')
      end

      it 'should be able to receiver the email' do
        expect(mail.to).to eq(['test@email.com'])
      end
    end
  end
end
