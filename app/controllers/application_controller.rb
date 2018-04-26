class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # 确保用户已登录 
  def logged_in_user
    unless logged_in?
      flash[:danger] = "请先登陆." 
      redirect_to login_url
    end
  end
end
