module Emails
  class ResetPasswordWorker
    include Sidekiq::Worker
    
    sidekiq_options queue: :default

    def perform(email, token)
      NotifyMailer.with(email: email, token: token).reset_password_email.deliver_now
    end
  end
end
