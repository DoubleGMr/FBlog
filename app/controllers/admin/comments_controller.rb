class Admin::CommentsController < Admin::ApplicationController
  def index
  	@comments = Comment.all
  end

  def destroy
  	Comment.find(params[:id]).destroy
  	flash[:success] = "成功删除该条评论."
    redirect_back(fallback_location: admin_dashboards_url)
  end
end
