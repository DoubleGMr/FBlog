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
end
