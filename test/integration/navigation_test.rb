require "test_helper"

class NavigationTest < ActionDispatch::IntegrationTest
  test "site title appears on sign in" do
    Woodlock.setup { |config| config.site_name = "Oauth links test" }

    visit root_url
    assert page.has_content?("Oauth links test")
  end

  test "authentication_services configuration" do
    Woodlock.setup { |config| config.authentication_services = "google" }

    visit root_url
    assert page.has_link?("Google")
    refute page.has_selector?("input#user_email")
    refute page.has_selector?("input#user_password")
    refute page.has_link?("Sign in")
    refute page.has_link?("Facebook")
    refute page.has_link?("Github")

    Woodlock.setup { |config| config.authentication_services = %w[password facebook github] }

    visit root_url
    refute page.has_link?("Google")
    assert page.has_selector?("input#user_email")
    assert page.has_selector?("input#user_password")
    assert page.has_button?("Sign in")
    assert page.has_link?("Facebook")
    assert page.has_link?("Github")
  end
end
