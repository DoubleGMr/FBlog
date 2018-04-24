class StaticPagesController < ApplicationController
  def index
  	@posts = Post.all
  	@tags = Tag.all
  end

  def about
  end
end
