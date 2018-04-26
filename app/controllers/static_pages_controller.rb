class StaticPagesController < ApplicationController

  def index
    @tag = params[:tag]
    @search = params[:search]
    if params[:sort].nil?
    	if @tag
    		@posts = Post.includes(:tags).where(is_publish: true, tags: {name: @tag}).order(id: :desc)
      elsif @search
          @posts = Post.where("title LIKE ?","%#{@search}%").order(id: :desc)
          if @posts.count == 0
            flash.now[:danger] = "没有类似的贴文."
          end
    	else
    		@posts = Post.where(is_publish: true).order(id: :desc)
   	  end
    else
      @order = (params[:sort] == '1' ? 'asc' : 'desc')
      if @tag
        @posts = Post.includes(:tags).where(is_publish: true, tags: {name: @tag}).order(id: :"#{@order}")
      elsif @search
        @posts = Post.where("title LIKE ?","%#{@search}%").order(id: :"#{@order}")
        if @posts.count == 0
            flash.now[:danger] = "没有类似的贴文."
        end    
      else
        @posts = Post.where(is_publish: true).order(id: :"#{@order}")
      end
    end
  	@tags = Tag.all
  	@comment = Comment.new
    @message = Message.new
    ip = request.remote_ip
    if !Visit.find_by(ip: ip)
      Visit.create!(ip: ip)
    end
  end

  def about
    @message = Message.new
    @about = About.first
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
