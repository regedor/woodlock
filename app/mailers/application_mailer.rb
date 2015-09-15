class ApplicationMailer < ActionMailer::Base
  default from: Woodlock.site_name
  layout 'mailer'
end
