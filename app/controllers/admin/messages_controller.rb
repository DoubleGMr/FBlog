class Admin::MessagesController < Admin::ApplicationController
  def index
  	@messages = Message.all
  end

  def destroy
  	Message.find(params[:id]).destroy
  	flash[:success] = "信件删除成功."
  	redirect_back(fallback_location: admin_messages_path)
  end
end
