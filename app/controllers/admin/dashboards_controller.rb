class Admin::DashboardsController < Admin::ApplicationController
  def index
  	@users = User.last(3)
  	@tags = Tag.all
  	@posts = Post.last(3)
  	@tag = Tag.new
  	@comments = Comment.last(3)
  end
end
