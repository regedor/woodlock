module Woodlock::OmniauthHelper
  # handles not so friendly provider name cases
  def provider_name(provider)
    provider_string = provider.to_s
    provider_string.eql?("google_oauth2") ? "google" : provider_string
  end
end
