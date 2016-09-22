require 'rubygems'
require 'rails'
require 'sass-rails'
require 'bootstrap-sass'
require 'bootswatch-rails'
require 'omniauth'
require 'omniauth-facebook'
require 'omniauth-google-oauth2'
require 'coffee-rails'
require 'jquery-rails'
require 'cancan'
require 'devise'
require 'execjs'
require 'activeadmin'
require 'gravtastic'
require 'sass_rails_patch'

if Rails.env.development? || Rails.env.test?
  require 'thin'
  require 'shoulda'
  require 'minitest'
  require 'capybara'
  require 'capybara-email'
end

module Woodlock
  class << self
    mattr_accessor :site_name, :site_email, :site_url, :gravatar_default_url, :authentication_services, :github_scope, :disable_welcome_email, :woodlock_theme, :github_callback_url

    self.site_name = 'Woodlock engine'
    self.site_email = 'info@woodlock.com'
    self.gravatar_default_url = 'http://www.apiflat.com/no_user.png'
    # add default values of more config vars here
  end

  # this function maps the vars from your app into your engine
  def self.setup(&block)
    yield self
  end

  class Engine < ::Rails::Engine
    initializer :assets do
      Rails.application.config.assets.precompile += %w(woodlock.js woodlock.css active_admin.css)
      Rails.application.config.assets.paths << root.join('app', 'assets', 'images')
    end

    initializer :woodlock do
      # error version: `gsub' for []:Array (NoMethodError)
      # ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/admin']
      ActiveAdmin.application.load_paths.unshift root.join('lib', 'admin').to_s
    end
  end
end
