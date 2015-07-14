require 'test_helper'

class WoodlockWelcomeTest < ActionMailer::TestCase
  test "omniauth_welcome" do
    mail = WoodlockWelcome.omniauth_welcome
    assert_equal "Omniauth welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
