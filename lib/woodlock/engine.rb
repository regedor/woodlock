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
#require 'sqlite3'
require 'pg'
require 'thin'
require 'shoulda'
require 'minitest'
require 'capybara'
require 'capybara-email'
require 'activeadmin'

module Woodlock
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w(woodlock.js woodlock.css active_admin.css)
      Rails.application.config.assets.paths << root.join("app", "assets", "images")
    end

    initializer :woodlock do
      ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/admin']
    end
  end
end
