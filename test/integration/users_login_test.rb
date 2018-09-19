require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new', 'Template is not rendering correctly.'
    post login_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
    assert_not flash.empty?, "#{flash.inspect} should not be empty."
    get root_path
    assert flash.empty?, "#{flash.inspect} should be empty."
  end
end
