class Admin::AdministratorsController < Admin::ApplicationController

  layout 'session'

  def edit
    @admin = Administrator.find(params[:id])
  end

  def update
    @admin = Administrator.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "管理员账号更新成功."
      redirect_to admin_dashboards_url
    else
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:administrator).permit(:name,:email,:password,:password_digest)
  end
end
