require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "lmzdxadmin", email: "lmzdxadmin@lmzdx.com", password: "lmzdx.com", password_confirmation: "lmzdx.com")
  end
  
  test "setup user should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end
  
  test "password should more that 6 characters" do
    @user.password = @user.password_confirmation = "12345"
    assert_not @user.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end 
  
end
