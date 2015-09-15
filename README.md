# Woodlock
[![Build Status](https://travis-ci.org/regedor/woodlock.svg?branch=master)](https://travis-ci.org/regedor/woodlock)
[![Code Climate](https://codeclimate.com/github/regedor/woodlock/badges/gpa.svg)](https://codeclimate.com/github/regedor/woodlock)
[![Test Coverage](https://codeclimate.com/github/regedor/woodlock/badges/coverage.svg)](https://codeclimate.com/github/regedor/woodlock/coverage)

Woodlock is an authentication and user management engine using *devise* and *active admin*.

This project rocks and uses MIT-LICENSE.

### Instructions

* Add to Gemfile:

```
#!ruby

gem 'woodlock', git: 'https://itmiguelfernandes@bitbucket.org/itmiguelfernandes/woodlock.git'

group :development, :test do
  gem 'thin'
end
```
* `bundle install`

* `rake railties:install:migrations`

* `rake db:migrate`

* Define `root_path`

* Add "config/initializers/woodlock.rb" file and specify the following:

```
Woodlock.setup do |config|
  config.site_name = 'My Site Name'
  config.site_email = 'my_site_email@mail.com'
  config.gravatar_default_url = 'http://www.my_gravatar_default_url.com/some_image.jpg'
end
```

* Define the following environment variables and add the file to .gitignore:

```
# config/initializers/app_env_vars.rb
ENV['OMNIAUTH_FACEBOOK_APP_ID'] = 'My Facebook App Id'
ENV['OMNIAUTH_FACEBOOK_APP_SECRET'] = 'My Facebook App Secret'
ENV['OMNIAUTH_GOOGLE_APP_ID'] = 'My Google App Id'
ENV['OMNIAUTH_GOOGLE_APP_SECRET'] = 'My Google App Secret'
```

* Load environment variables before environments/*.rb:

```
# config/environment.rb
app_env_vars = File.join(Rails.root, 'config', 'initializers', 'app_env_vars.rb')
load(app_env_vars) if File.exists?(app_env_vars)

# ...

```

* Add logo file "woodlock-logo.png" to public folder (maximum width/height: 300x48)

* Add background image "woodlock-background.jpg" to public folder
