Woodlock.setup do |config|
  config.site_name = 'Test Site Name'
  config.site_email = 'test_site_email@mail.com'
  config.site_url = 'www.test_site_url.com'
  config.gravatar_default_url = 'http://www.apiflat.com/no_user.png'
  config.authentication_services = ['google','facebook','password','github']
  config.github_scope = 'user:email, repo'
  config.github_callback_url = 'http://localhost:3000/auth/github/callback'
  config.woodlock_theme = 'amelia'
end
