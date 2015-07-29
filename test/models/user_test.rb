require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_length_of(:first_name).is_at_most(30)
  should_not allow_value('1miguel', 'miguel duarte', '@miguel').for(:first_name)

  should validate_presence_of(:last_name)
  should validate_length_of(:last_name).is_at_most(30)
  should_not allow_value('1fernandes', 'miguel fernandes', '@fernandes').for(:last_name)

  should validate_presence_of(:email)
  should_not allow_value('test@test', 'test@', '@test.com').for(:email)

  test 'should return full name' do
    user = users(:miguelfernandes)
    assert_equal 'Miguel Fernandes', user.full_name
  end
end
