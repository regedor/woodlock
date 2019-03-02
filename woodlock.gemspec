$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "woodlock/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "woodlock"
  s.version     = Woodlock::VERSION
  s.authors     = ["Miguel Regedor"]
  s.email       = ["miguelregedor@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Woodlock."
  s.description = "Description of Woodlock."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
  s.add_dependency "devise"
  s.add_dependency "omniauth-facebook"
  s.add_dependency "omniauth-github"
  s.add_dependency "omniauth-google-oauth2"
  s.add_dependency "bootstrap", ">= 4.0.0.alpha6"
  s.add_dependency "sprockets-rails", ">= 2.3.2"
  s.add_dependency "rails-assets-tether"
  s.add_dependency "coffee-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "minitest", ">= 5.10.1"

  s.add_development_dependency "sqlite3", "~> 1.3.6"
end
