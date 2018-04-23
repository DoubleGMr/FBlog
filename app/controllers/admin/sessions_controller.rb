class Admin::SessionsController < Admin::ApplicationController

  before_action :authorize, except: [:new,:create]
  layout 'layouts/session'

  def new
  end

  def create
  	admin = Administrator.find_by(email: params[:session][:email].downcase)
  	if admin && admin.authenticate(params[:session][:password])
      admin_log_in admin
      params[:session][:remember_me] == '1' ? admin_remember(admin) : admin_forget(admin)
  		redirect_to admin_dashboards_url
  	else
  		flash.now[:danger] = '账号/密码错误,请重新输入.'
  		render 'new'
  	end
  end

  def destroy
  	admin_log_out if admin_logged_in?
    redirect_to root_url
  end
end
