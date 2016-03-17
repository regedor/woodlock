# Woodlock
[![Build Status](https://travis-ci.org/regedor/woodlock.svg?branch=master)](https://travis-ci.org/regedor/woodlock)
[![Code Climate](https://codeclimate.com/github/regedor/woodlock/badges/gpa.svg)](https://codeclimate.com/github/regedor/woodlock)
[![Test Coverage](https://codeclimate.com/github/regedor/woodlock/badges/coverage.svg)](https://codeclimate.com/github/regedor/woodlock/coverage)

Woodlock is an authentication and user management engine using *gravtastic*, *devise*, *active admin* and *google analytics*.

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
  config.site_url = 'www.my_site_url.com'
  config.gravatar_default_url = 'http://www.my_gravatar_default_url.com/some_image.jpg'
  config.authentication_services = ['site','google','facebook','github'] # Optional. Defaults to site, google and facebook.
  config.github_scope = 'user:email' # add your custom scopes i.e. 'user:email, repo'
  config.disable_welcome_email = 'false' # defaults to false
end
```

* Define the following secrets:

```
# config/secrets.yml
  omniauth_facebook_app_id: <facebook_app_id>
  omniauth_facebook_app_secret: <facebook_app_secret>
  omniauth_google_client_id: <google_client_id>
  omniauth_google_client_secret: <google_client_secret>
  omniauth_github_client_id: <github_client_id>
  omniauth_github_client_secret: <github_client_secret>
  google_analytics_tracking_id: <google_analytics_tracking_id>

```

* Override photo_url method on User model if you want to change photo priority. (Defaults to facebook then google then gravatar)

* Add logo file "woodlock-logo.png" to public folder (maximum width/height: 300x48)

* Add background image "woodlock-background.jpg" to public folder

* If you need to load Woodlock's routes after the main app's, add to the main app application.rb file:

```
  initializer :munge_routing_paths, :after => :add_routing_paths do |app|
    engine_routes_path = app.routes_reloader.paths.select{|path| path =~ //}.first
    app.routes_reloader.paths.delete(engine_routes_path)
    app.routes_reloader.paths << engine_routes_path
  end

```
