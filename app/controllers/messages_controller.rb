class MessagesController < ApplicationController

	def create
		@message = Message.new(message_params)
		if @message.save
			flash[:success] = "信件投递成功,作者将在三个工作日内回复."
		else
			flash[:danger] = "信件投递失败,请检查投递内容是否填写准确."
		end
		redirect_back(fallback_location: root_url)
	end

	private

	def message_params
		params.require(:message).permit(:name,:email,:message_type,:content)
	end
end
