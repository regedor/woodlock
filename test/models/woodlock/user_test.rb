require "test_helper"

class Woodlock::UserTest < ActiveSupport::TestCase
  test "#find_or_create_with_oauth returns the user when it's found" do
    user = woodlock_users(:miguelregedor)
    result =
      Woodlock::User.find_or_create_with_oauth(facebook_omniauth_hash_mock(email: user.email))
    assert_equal result, user
  end

  test "#find_or_create_with_oauth creates new user" do
    Woodlock::User.destroy_all

    assert_difference("Woodlock::User.count", 1, "Should increment Woodlock::User by 1") do
      Woodlock::User.find_or_create_with_oauth(
        google_omniauth_hash_mock(
          name: "New name",
          email: "new_email@mail.com",
          first_name: "New",
          last_name: "name"
        )
      )
    end
  end
end
