class WoodlockWelcomeMailer < ApplicationMailer
  def omniauth_welcome(user, provider)
    case provider
    when 'google_oauth2' then provider_name = 'Google'
    when 'facebook' then provider_name = 'Facebook'
    else provider_name = 'unknown provider'
    end

    @greeting = "Hi #{user.first_name}! Thanks for registering with #{provider_name}."

    mail to: user.email, subject: "#{provider_name} registration success"
  end
end
