module SessionsHelper

	#log in user
	def log_in(user)
		session[:user_id] = user.id
	end

	#log out user
	def log_out
		reset_session
		@current_user = nil
	end


	#wipe session
	def reset_session
		session.delete(:user_id)
		@current_user = nil
	end

	#current user or nil
	def current_user
		if @current_user.nil?
			@current_user = User.find_by(id: session[:user_id])
		else
			@current_user
		end
	end

	#is logged in
	def logged_in?
		!current_user.nil?
	end
end
