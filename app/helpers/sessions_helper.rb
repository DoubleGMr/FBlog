module SessionsHelper
	#登入指定的用户
	def log_in(user)
		session[:user_id] = user.id
	end

	# 在持久会话中记住用户 
	def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
	end

	#返回当前登陆的用户
	def current_user
		if (user_id = session[:user_id]) 
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(:remember, cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end

	# 如果用户已登录，返回 true，否则返回 false 
	def logged_in?
		!current_user.nil? 
	end

	# 退出当前用户 
	def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
	end

	# 忘记持久会话 
	def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
	end

  			  #admin登陆

	def admin_log_in(admin)
		session[:admin_id] = admin.id
	end

	def admin_remember(admin)
        admin.remember
        cookies.permanent.signed[:admin_id] = admin.id
        cookies.permanent[:remember_token] = admin.remember_token
	end

	def current_admin
		if (admin_id = session[:admin_id]) 
			@current_admin ||= Administrator.find_by(id: admin_id)
		elsif (admin_id = cookies.signed[:admin_id])
			admin = Administrator.find_by(id: admin_id)
			if admin && admin.authenticated?(:remember, cookies[:remember_token])
				admin_log_in admin
				@current_admin = admin
			end
		end
	end

	def admin_logged_in?
		!current_admin.nil? 
	end

	# 退出当前用户 
	def admin_log_out
        admin_forget(current_admin)
        session.delete(:admin_id)
        @current_admin = nil
	end

	# 忘记持久会话 
	def admin_forget(admin)
        admin.forget
        cookies.delete(:admin_id)
        cookies.delete(:remember_token)
	end
end
