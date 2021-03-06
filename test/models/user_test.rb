require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  # Presence tests
  test 'name should be present' do
    @user.name = '  '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '  '
    assert_not @user.valid?
  end

  test 'password should be present (non-blank)' do
    @user.password = @user.password_confirmation = '  ' * 6
    assert_not @user.valid?
  end

  # Format tests
  test 'name should be not too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should be not too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %W[ user@example.com USER@foo.COM A_US-ER@foo.bar.org
                          first.last@foo.jp alice+bob@baz.cn ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[foo@bar..com user@example,com user_at_foo.org user.name@example.]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  # Uniqueness tests
  test 'email address should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?, "#{duplicate_user.inspect} should be unique"
  end

  test 'email addresses should be saved as lowercase' do
    mixed_case_email = "Foo@ExAmPlE.Com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
