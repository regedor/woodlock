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
require 'pg'
require 'activeadmin'
require 'gravtastic'

if Rails.env.development? || Rails.env.test?
  require 'thin'
  require 'sqlite3'
  require 'shoulda'
  require 'minitest'
  require 'capybara'
  require 'capybara-email'
end

module Woodlock
  class << self
    mattr_accessor :site_name, :site_email, :gravatar_default_url

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
      #ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/admin']
      ActiveAdmin.application.load_paths.unshift root.join('lib', 'admin').to_s
    end
  end
end
