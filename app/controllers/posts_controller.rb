class PostsController < ApplicationController

  def show
  	@post = Post.find(params[:id])
  	@comment = Comment.new
  end

  private

  	def post_params
  		params.require(:post).permit(:title,:content,:is_publish,:tag_id)
  	end
end
