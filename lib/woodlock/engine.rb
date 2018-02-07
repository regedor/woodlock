require "devise"
require "omniauth-facebook"
require "omniauth-google-oauth2"
require "omniauth-github"
require "bootstrap"
require "jquery-rails"
require "coffee-rails"
require "rails-assets-tether"
require "byebug"

module Woodlock
  class << self
    mattr_accessor \
      :site_name,
      :site_email,
      :site_url,
      :authentication_services,
      :hide_sign_up_forgot_password,
      :github_scope,
      # TODO: build mailer
      :welcome_email,
      :github_callback_url
  end

  # allows the main app to pass the engine variables through the woodlock.rb initializer
  def self.setup
    yield self
  end

  class Engine < ::Rails::Engine
    config.autoload_paths << File.expand_path("../../../app/lib", __FILE__)
    # needed for views/layouts/devise.html.erb
    config.assets.precompile += %w[woodlock/woodlock.css woodlock/woodlock.js]
  end
end
