require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  setup :initialize_user

  test "login with invalid information" do
  	get login_path
  	assert_template 'session/new'
  	post session_new, session: { username: "", email: "", password: "", password_confirmation: "" }
  	assert_template 'session/new'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end

  test "login with valid information and logout again" do
  	get login_path
    assert_template 'session/new'
  	post session_new, session: { id: 1, username: "tartan", email: "tartan@cmu.edu", password: "foobar", password_confirmation: "foobar"}
  	assert_equal session[:user_id], @users.id
  	assert_redirect_to @users
  	follow_redirect!
  	assert_template 'users/show'
  	assert select "a[href=?]", logout_path
  	assert select "a[href=?]", user_path(@users)
  	assert select "a[href=?]", login_path, count: 0
  	delete logout_path
  	assert_nil session[:user_id]
  	assert_redirected_to root_path
  	follow_redirect!
  	assert select "a[href=?]", logout_path, count: 0
  	assert select "a[href=?]", user_path(@users), count: 0
  	assert select "a[href=?]", login_path
  end

  private

  def initialize_user
  	@user = users(:one)
    @user.id = 1
  	@user.password = @user.password_confirmation = "foobar"
  end
end
