module SessionsHelper
	def sign_in(user)
		username = user.username
		cookies.permanent[:username] = username
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by(username: cookies[:username])
	end

	def sign_out
		cookies.delete(:username)
		@current_user = nil
	end
end
