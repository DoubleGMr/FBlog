class Admin::AboutsController < Admin::ApplicationController
	def index
		if About.first
			@about = About.first
		else
			@about = About.new
		end
	end

	def create
		@about = About.new(about_params)
		if @about.save
			flash[:success] = "简介创建成功,请确认."
		else
			flash[:danger] = "简介创建失败,请重试."
		end
		redirect_back(fallback_location: admin_abouts_url)
	end

	def update
		@about = About.first
		if @about.update_attributes(about_params)
			flash[:success] = "简介更新成功."
		else
			flash[:danger] = "简介更新失败,请重试."
		end
		redirect_back(fallback_location: admin_abouts_url)
	end

	private

	def about_params
		params.require(:about).permit(:introduce,:knowledge,:exception,:contact)
	end
end
