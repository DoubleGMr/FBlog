class Admin::DashboardsController < Admin::ApplicationController
  def index
  	@users = User.last(3)
  end
end
