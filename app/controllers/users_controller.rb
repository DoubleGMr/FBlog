class UsersController < ApplicationController
  before_action :logged_in_user,only: :show
  before_action :correct_user,only: :show

  layout 'session',only: [:new,:create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
       @user.send_activation_email
      flash[:info] = "请检查你邮箱中的激活邮件."
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def show
  end

  private

  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  # 确保用户已登录 
  def logged_in_user
    unless logged_in?
      flash[:danger] = "请先登陆." 
      redirect_to login_url
    end
  end

  # 确保是正确的用户 
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user 
  end
end
