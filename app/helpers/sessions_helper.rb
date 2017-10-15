module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = 'الرجاء تسجيل الدخول قبل البدء بالعمل'
			redirect_to root_url
		end
	end

    def correct_user
      user = User.find(params[:id])
      if !(user == current_user)
	flash[:danger] = 'الرجاء استعمال المستخدم الصحيح لتعديل بيانات المستخدم'
      	redirect_to(root_url) 
      end 
    end	

    def user_is_admin
    	if(logged_in?)
		redirect_to root_url unless current_user.name == 'admin'
	end
    end
end
