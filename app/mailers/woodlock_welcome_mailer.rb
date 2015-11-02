class WoodlockWelcomeMailer < ApplicationMailer
  def omniauth_welcome(user, provider)
    case provider
    when 'google_oauth2' then provider_name = 'Google'
    when 'facebook' then provider_name = 'Facebook'
    else provider_name = 'unknown provider'
    end

    @greeting = "#{ t('hi') } #{ user.first_name }! #{ t('thanks_for_registration') }."

    mail to: user.email, reply_to: Woodlock.site_email, subject: "#{ Woodlock.site_name } - #{ provider_name } #{ t('registration_success') }"
  end
end
