class Admin::MessagesController < Admin::ApplicationController
  def index
  	@messages = Message.all
  end

  def destroy
  	Message.find(params[:id]).destroy
  	flash[:success] = "信件删除成功."
  	redirect_back(fallback_location: admin_messages_path)
  end

  def delete_all
    Message.delete_all
    flash[:success] = "成功清空信件箱."
    redirect_back(fallback_location: admin_dashboards_url)
  end
end
