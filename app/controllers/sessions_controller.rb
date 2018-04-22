class SessionsController < ApplicationController

  layout 'layouts/session'

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to root_url
  	else
  		flash.now[:danger] = '账号/密码错误,请重新输入.'
  		render 'new'
  	end
  end

  def destroy
  	log_out
    redirect_to root_url
  end
end
