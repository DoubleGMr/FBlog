class Admin::CommentsController < Admin::ApplicationController
  def index
  	@comments = Comment.all
  end

  def destroy
  	Comment.find(params[:id]).destroy
  	flash[:success] = "成功删除该条评论."
  	if(params[:f_a])
      redirect_back(fallback_location: admin_dashboards_url)
    else
      redirect_to admin_comments_url
    end
  end
end
