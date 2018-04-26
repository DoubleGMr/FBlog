class CommentsController < ApplicationController
  before_action :logged_in_user,only: :create
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = '评论成功发布.'
    else
      flash[:danger] = '未正确填写,请重试.'
    end
    redirect_back(fallback_location: root_url)
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:post_id)
  end
end
