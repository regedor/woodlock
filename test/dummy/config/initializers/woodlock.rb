Woodlock.setup do |config|
  config.site_name               = "Test Site Name"
  config.site_email              = "test_site_email@mail.com"
  config.site_url                = "www.test_site_url.com"
  config.authentication_services = %w[google facebook password github]
  config.github_scope            = "user:email, repo"
  config.welcome_email           = false
  config.github_callback_url     = "http://localhost:3000/auth/github/callback"
end
