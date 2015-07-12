require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # email
  should validate_presence_of(:email)
  should_not allow_value('test@test', 'test@', '@test.com').for(:email)
end
