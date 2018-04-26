class PostsController < ApplicationController

  def show
  	@post = Post.find(params[:id])
  	@comment = Comment.new
  	View.create(ip: request.remote_ip,post_id: @post.id)
  end
end
