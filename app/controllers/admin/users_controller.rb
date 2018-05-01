class Admin::UsersController < Admin::ApplicationController

  def index
  	@users = User.all.order(id: :asc)
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "该用户资料更新成功."
    else
      flash[:danger] = "用户资料更新失败,请重新尝试."
    end
    redirect_to admin_user_url(@user)
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = '用户删除成功.'
    if(params[:f_a])
      redirect_back(fallback_location: admin_dashboards_url)
    else
      redirect_to admin_users_url
    end
  end

  def delete_all
    Comment.delete_all
    User.delete_all
    redirect_back(fallback_location: admin_dashboards_url)
    flash[:success] = "成功删除所有用户."
  end


  def change_user
    @admin_status = params[:admin_status] == 'false' ? 'true' : 'false'
    @user = User.friendly.find(params[:id])
    if @admin_status == 'true'
      flash[:success] = "成功将#{@user.name}设为代管理员."
    else
      flash[:danger] = "成功取消#{@user.name}代管理员身份."
    end
    @user.update(admin: "#{@admin_status}")
    redirect_back(fallback_location: admin_dashboards_url)
  end

  private

  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
