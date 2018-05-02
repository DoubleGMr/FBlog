module ApplicationHelper
	def time_now time
		time.strftime("%A %B %d,%Y")
	end

	def count count
		if count >= 1000
			str = " #{count%1000.round(1).to_s} k"
		else
			str = " #{count}"
		end
		return str
	end

	def image_show user
		if user.try(:admin)
			"pic.jpg"
		else
			"user.jpg"
		end
	end
end
