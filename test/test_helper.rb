# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
require "rails/test_help"
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/rails'
require 'capybara/email'

class ActiveSupport::TestCase
 fixtures :all
end


class ActionDispatch::IntegrationTest
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  include Capybara::DSL
  include Capybara::Email::DSL
  
  def teardown
    Capybara.reset_sessions!
  end
end

class ActionController::TestCase
  setup do
    @routes = Engine.routes
  end
  include Devise::TestHelpers
end
# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

if ActionDispatch::IntegrationTest.method_defined?(:fixture_path=)
  ActionDispatch::IntegrationTest.fixture_path = File.expand_path("../fixtures", __FILE__)
end

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActiveSupport::TestCase.fixtures :all
end
