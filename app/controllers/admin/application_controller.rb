class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout "admin"
  layout "admin/layouts/application"

  include SessionsHelper
  before_action :authorize

  def authorize
  	unless current_admin
  		redirect_to admin_login_url
  		flash[:danger]="管理员空间,请先登陆."
  	end
  end

end