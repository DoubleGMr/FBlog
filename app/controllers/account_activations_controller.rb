class AccountActivationsController < ApplicationController
	def edit
		user = User.find_by(email: params[:email])
		if user && !user.activated? && user.authenticated?(:activation, params[:id])
		   user.activate
           log_in user
           flash[:success] = "欢迎登陆ReadTime."
		else
           flash[:danger] = "错误的激活链接."
		end
		redirect_to root_url
	end
end
