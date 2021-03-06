require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["y13422496263@163.com"], mail.from
    body_content = mail.body.encoded.split(/\r\n/).map{|i| Base64.decode64(i)}.join
    assert_match user.name, body_content
    assert_match user.activation_token, body_content
    assert_match CGI.escape(user.email), body_content
  end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Password reset", mail.subject 
    assert_equal [user.email], mail.to
    assert_equal ["y13422496263@163.com"], mail.from
    body_content = mail.body.encoded.split(/\r\n/).map{|i| Base64.decode64(i)}.join
    assert_match user.reset_token, body_content
    assert_match CGI.escape(user.email), body_content
  end
end
