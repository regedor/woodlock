source 'https://rubygems.org'

#ruby '2.2.1'

# Declare your gem's dependencies in woodlock.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]
gem 'pg'

group :development, :test do
  gem 'thin', '~> 1.6.3'
  gem 'minitest', '~> 5.7.0'
  gem 'capybara', '~> 2.4.4' 
  gem 'capybara-email', '~> 2.4.0'
  gem 'shoulda', '~> 3.5.0' 
  gem 'codeclimate-test-reporter'
  gem 'byebug'
end
