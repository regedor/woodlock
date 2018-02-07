# Woodlock

## Installation

* Add to Gemfile:
```
gem "woodlock", git: "https://github.com/regedor/woodlock.git"
```
* `bundle install`
* `rake railties:install:migrations`
* `rake db:migrate`
* Create in initializer in the main app and specify the desired configuration:
```
# config/initializers/woodlock.rb

Woodlock.setup do |config|
  config.site_name                    = "My Site Name"
  config.site_email                   = "my_site_email@mail.com"
  config.site_url                     = "www.my_site_url.com"
  config.authentication_services      = ["password", "google", "facebook", "github"]
  config.hide_sign_up_forgot_password = false
  config.github_scope                 = "user:email"
  config.welcome_email                = false 
  config.github_callback_url          = "http://localhost:3000/auth/github/callback"
end
```

* Define the secrets you need:
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

Add `/*= require woodlock/woodlock.css */` to `app/assets/application.css`
Add `//= require woodlock/woodlock.js` to `app/assets/application.js`

* Set default_url_options for ActionMailer:
```
  # config/environments/development.rb
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
```
```
  # config/environments/production.rb
  config.action_mailer.default_url_options = { host: "my_production_app.com" }
```
## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
