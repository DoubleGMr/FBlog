class Admin::DashboardsController < Admin::ApplicationController
  def index
  	@users = User.last(3)
  	@tags = Tag.all
  	@posts = Post.last(3)
  	@tag = Tag.new
  end
end
