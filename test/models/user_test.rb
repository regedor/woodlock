require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_length_of(:first_name).is_at_most(30)
  should validate_length_of(:last_name).is_at_most(30)

  should validate_presence_of(:email)
  should_not allow_value('test@test', 'test@', '@test.com').for(:email)

  test 'should return full name' do
    user = users(:miguelfernandes)
    assert_equal 'Miguel Fernandes', user.full_name
  end

  test 'should check if user has not a gravatar' do
    assert_difference 'User.count', 1 do
      u = User.new(email: 'maria@mail.com', password: 'password', first_name: 'Maria', last_name: 'Manuela', confirmed_at: 1.day.ago)
      u.save
      refute u.gravatar?, 'User should not have gravatar.'
    end
  end
end
