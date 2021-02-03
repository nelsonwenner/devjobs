class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  default(
    from: -> { ENV["DEFAULT_FROM_EMAIL"] },
    template_path: ->(mailer) { "mailers/#{mailer.class.name.underscore}" },
  )
end
