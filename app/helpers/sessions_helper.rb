module SessionsHelper

	#loginメソッド定義　＝＞sesssion.contorollerへ
	def log_in(user)
		session[:user_id] = user.id
	end

	#current_userメソッド :login状態かどうかによって動作を変更させる用
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	#login=>true  x=>false
	def logged_in?
		!current_user.nil?
	end

	#logoutメソッド
	def log_out
		session.delete(:user_id)
		@current_user =nil
	end

end
