require 'rails_helper'

RSpec.describe ResetPasswordMailer, type: :mailer do
  data_email_token = 'test@email.com', 'xxzwxcLYz/D46K4RkJY0tchMZv0atSA9'
  let(:mail) { ResetPasswordMailer.call(data_email_token).deliver_now }

  describe "ResetPasswordMailer #call" do
    context 'when attributes are renders' do
      it 'ensure be able to render the subject' do
        expect(mail.subject).to eq('Password Reset')
      end
    end
  end
end
