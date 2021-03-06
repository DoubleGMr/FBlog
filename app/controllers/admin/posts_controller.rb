class Admin::PostsController < Admin::ApplicationController
  def index
    if params[:search]
      @posts = Post.where("title LIKE ?","%#{params[:search]}%").order(id: :desc)
      if @posts.count == 0
        flash.now[:danger] = "查询不到类似文章."
      end
    else
      @posts = Post.all.order(id: :desc)
    end
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.administrator_id = current_admin.id
  	if @post.save
  		flash[:success] = "帖文创建成功!"
  	else
  		flash[:danger] = "帖文因某个错误创建失败!"
  	end
    redirect_to admin_posts_url
  end

  def update
  	@post = Post.friendly.find(params[:id])
  	if @post.update_attributes(post_params)
  		flash[:success] = "帖文内容更新成功."
  	else
  		flash[:danger] = "某个错误的输入导致帖文更新失败."
  	end
  	redirect_to admin_post_url(@post)
  end

  def show
  	@post = Post.friendly.find(params[:id])
    @comment = Comment.new
  end

  def destroy
  	Post.friendly.find(params[:id]).destroy
  	flash[:success] = "成功删除帖文."
  	if(params[:f_a])
      redirect_back(fallback_location: admin_dashboards_url)
    else
      redirect_to admin_posts_url
    end
  end

  def change_status
    @status = params[:status] == 'false' ? 'true' : 'false'
    @post = Post.friendly.find(params[:id])
    @post.update(is_publish: "#{@status}")
    flash[:success] = "#{@post.title} 状态改变成功."
    redirect_back(fallback_location: admin_posts_url)
  end

  private

  	def post_params
  		params.require(:post).permit(:title,:content,:is_publish,:tag_ids)
  	end
end
