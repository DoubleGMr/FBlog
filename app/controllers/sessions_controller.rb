class SessionsController < ApplicationController

  layout 'layouts/session'

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      else
        message  = "账号还未激活. "
        message += "请检查邮箱中的激活链接."
        flash[:warning] = message
      end
  		redirect_to root_url
  	else
  		flash.now[:danger] = '账号/密码错误,请重新输入.'
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
