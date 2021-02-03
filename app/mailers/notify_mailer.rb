class NotifyMailer < ApplicationMailer
  def reset_password_email
    @email = params[:email]
    @token = params[:token]

    mail(to: @email, subject: 'Password Reset')
  end
end
