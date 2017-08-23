require "test_helper"

class Woodlock::OauthParserTest < ActiveSupport::TestCase
  setup do
    @facebook_auth = facebook_omniauth_hash_mock
    @oauth_parser = Woodlock::OauthParser.new(@facebook_auth)
  end

  test "#provider" do
    assert_equal @facebook_auth["provider"], @oauth_parser.provider
  end

  test "#email" do
    assert_equal @facebook_auth["info"]["email"], @oauth_parser.email
  end

  test "#first_name" do
    assert_equal @facebook_auth["info"]["first_name"], @oauth_parser.first_name
  end

  test "#last_name" do
    assert_equal @facebook_auth["info"]["last_name"], @oauth_parser.last_name
  end

  test "#first_name and #last_names" do
    parser =
      Woodlock::OauthParser.new(
        facebook_omniauth_hash_mock(first_name: nil, last_name: nil, name: "Miguel Regedor")
      )

    assert_equal "Miguel", parser.first_name
    assert_equal "Regedor", parser.last_name
  end

  test "#gender" do
    assert_equal @facebook_auth["extra"]["raw_info"]["gender"], @oauth_parser.gender
  end

  test "#image" do
    assert_equal @facebook_auth["info"]["image"], @oauth_parser.image
  end

  test "#github_username" do
    github_auth = github_omniauth_hash_mock
    parser = Woodlock::OauthParser.new(github_auth)

    assert_equal github_auth["info"]["nickname"], parser.github_username
  end
end
