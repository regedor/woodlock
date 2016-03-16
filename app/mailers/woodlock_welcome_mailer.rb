class WoodlockWelcomeMailer < ApplicationMailer
  def omniauth_welcome(user, provider)
    provider_name =
      if provider == 'google_oauth2'
        provider_name = 'Google'
      elsif provider.blank?
        'sevice provider'
      else
        provider.capitalize
      end

    @greeting = "#{ t('hi') } #{ user.first_name }! #{ t('thanks_for_registration') }."

    mail to: user.email, reply_to: "#{Woodlock.site_email}", subject: "#{Woodlock.site_name} - #{provider_name} #{t('registration_success')}"
  end
end
