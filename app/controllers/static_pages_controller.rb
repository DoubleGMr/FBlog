class StaticPagesController < ApplicationController

  def index
  	if params[:tag]
  		@posts = Post.includes(:tags).where(is_publish: true, tags: {name: params[:tag]}).order(id: :desc)
  	else
  		@posts = Post.where(is_publish: true).order(id: :desc)
 	 end
  	@tags = Tag.all
  	@comment = Comment.new
  end

  def about
  end

  def posts_vote
    post_id = params[:post_id]
    ip = request.remote_ip
    if !Vote.find_by(ip: ip,post_id: post_id)
      @vote = Vote.new(ip:ip,post_id:post_id)
      if @vote.save
        flash[:success] = "感谢您的支持,站主会继续努力..."
      else
        flash[:danger] = "很抱歉,貌似出现了一点错误..."
      end
    else
      flash[:danger] = "感谢您的支持,您已进行过评价."
    end  
      redirect_back(fallback_location: root_url)
  end

end
