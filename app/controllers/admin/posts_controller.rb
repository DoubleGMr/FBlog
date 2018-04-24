class Admin::PostsController < Admin::ApplicationController
  def index
  	@posts = Post.all
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
  	@post = Post.find(params[:id])
  	if @post.update_attributes(post_params)
  		flash[:success] = "帖文内容更新成功."
  	else
  		flash[:danger] = "某个错误的输入导致帖文更新失败."
  	end
  	redirect_to admin_post_url(@post)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	Post.find(params[:id]).destroy
  	flash[:success] = "成功删除帖文."
  	if(params[:f_a])
      redirect_back(fallback_location: admin_dashboards_url)
    else
      redirect_to admin_posts_url
    end
  end

  private

  	def post_params
  		params.require(:post).permit(:title,:content,:is_publish,:tag_ids)
  	end
end
