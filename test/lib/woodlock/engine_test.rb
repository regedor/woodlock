require "test_helper"

class Woodlock::EngineTest < ActiveSupport::TestCase
  test "set engine variables" do
    Woodlock.setup do |config|
      config.site_name               = "Test Site"
      config.site_email              = "testsite@mail.com"
      config.site_url                = "www.testsite.com"
      config.authentication_services = %w[google facebook password github]
      config.github_scope            = "user:email, repo"
      config.welcome_email           = false
      config.github_callback_url     = "http://localhost:3000/auth/github/callback"
    end

    assert_equal "Test Site", Woodlock.site_name
    assert_equal "testsite@mail.com", Woodlock.site_email
    assert_equal "www.testsite.com", Woodlock.site_url
    assert_equal %w[google facebook password github], Woodlock.authentication_services
    assert_equal "user:email, repo", Woodlock.github_scope
    refute Woodlock.welcome_email
    assert_equal "http://localhost:3000/auth/github/callback", Woodlock.github_callback_url
  end
end
