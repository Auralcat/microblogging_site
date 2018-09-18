require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '',
                                         email: 'user@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end
  end

  test 'page has inputs and labels for each field in the model' do
    get signup_path

    model_params = %w[name email password password_confirmation]
    model_params.each do |param|
      assert_select "#user_#{param}"
      assert_select "label[for=user_#{param}]", param.humanize
    end
  end

  test 'shows 5 error messages when receiving blank input' do
    skip
    get signup_path
    assert_select 'ul' do
      assert_select 'li', 5
    end
  end
end
