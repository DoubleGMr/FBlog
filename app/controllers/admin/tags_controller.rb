class Admin::TagsController < Admin::ApplicationController

	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			flash[:success] = "#{@tag.name}标签创建成功."
		else
			flash[:danger] = "标签创建因某个失误而失败."
		end
		redirect_to admin_dashboards_url
	end

	def destroy
		Tag.find(params[:id]).destroy
		flash[:success] = "标签已被成功删除."
		redirect_to admin_dashboards_url
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end
end
