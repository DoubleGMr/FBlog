require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	def setup
		ActionMailer::Base.deliveries.clear 
	end
  	test "valid signup information with account activation" do
	  	get sign_path
		assert_difference 'User.count',1 do
	    	post users_path, params: { user: { name:  "Example User",
	                                	email: "user@example.com",
	                                	password: "password",
										password_confirmation: "password" } }
		end
		assert_equal 1, ActionMailer::Base.deliveries.size 
		user = assigns(:user)
		assert_not user.activated?
		# 尝试在激活之前登录
		log_in_as(user)
		assert_not is_logged_in?
		# 激活令牌无效
		get edit_account_activation_path("invalid token", email: user.email) 
		assert_not is_logged_in?
		# 令牌有效，电子邮件地址不对
		get edit_account_activation_path(user.activation_token, email: 'wrong') 
		assert_not is_logged_in?
		# 激活令牌有效
		get edit_account_activation_path(user.activation_token, email: user.email) 
		assert user.reload.activated?
		follow_redirect!
		assert_template root_path
		assert is_logged_in?
	end
end
