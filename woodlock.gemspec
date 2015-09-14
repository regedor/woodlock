$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "woodlock/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "woodlock"
  s.version     = Woodlock::VERSION
  s.authors     = ["Miguel Regedor", "Miguel Fernandes"]
  s.email       = ["miguelregedor@gmail.com","it.miguelfernandes@gmail.com"]
  s.homepage    = "https://github.com/regedor/woodlock"
  s.summary     = "Authentication and user management engine."
  s.description = "Woodlock is an authentication and user management engine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency 'sass-rails', '~> 5.0.3'
  s.add_dependency 'bootstrap-sass', '~> 3.3.4.1'
  s.add_dependency 'bootswatch-rails', '~> 3.3.4'
  s.add_dependency 'omniauth', '~> 1.2.2'
  s.add_dependency 'omniauth-facebook', '~> 2.0.1'
  s.add_dependency 'omniauth-google-oauth2', '~> 0.2.6'
  s.add_dependency 'coffee-rails', '~> 4.1.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails', '~> 5.0'
  s.add_dependency 'activeadmin', '~> 1.0.0.pre1'
  s.add_dependency 'cancan', '~> 1.6.10'
  s.add_dependency 'devise', '~> 3.5.1'
  s.add_dependency 'execjs', '~> 2.5.2'
  s.add_dependency 'gravtastic', '~> 3.2.6'
end
