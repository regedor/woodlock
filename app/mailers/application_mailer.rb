class ApplicationMailer < ActionMailer::Base
  default from: Woodlock.site_email
  layout 'mailer'
end
