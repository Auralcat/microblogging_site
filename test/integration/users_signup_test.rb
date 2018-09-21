require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    get signup_path
  end

  test 'invalid signup information' do
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '',
                                         email: 'user@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end
  end

  test 'page has inputs and labels for each field in the model' do
    model_params = %w[name email password password_confirmation]
    model_params.each do |param|
      assert_select "#user_#{param}"
      assert_select "label[for=user_#{param}]", param.humanize
    end
  end

  test 'shows 5 error messages when receiving blank input' do
    skip
    assert_select 'ul' do
      assert_select 'li', 5
    end
  end

  test 'valid user information' do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Success',
                                         email: 'valid.email@email.com',
                                         password: 'supersecurepasswordwithoutstuff',
                                         password_confirmation: 'supersecurepasswordwithoutstuff' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert logged_in?
    assert_not flash.empty?
  end
end
