class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit , :update] 
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      notice = 'تم خلق الحساب' + @user.name + ' جديد بنجاح'
  		log_in @user
      ActionLog.create(username: current_user.name , action_type: 1 , finished: :true, notice: notice)          
  		flash[:success] = 'تم خلق حساب جديد بنجاح'
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user =  User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
      notice = 'تم تعديل بيانات المستخدم' + @user.name + ' بنجاح'
      ActionLog.create(username: current_user.name , action_type: 2 , finished: :true, notice: notice)          

  		flash[:success] = 'تم تعديل بيانات المستخدم بنجاح'
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name,:email, :password, :password_confirmation)
  	end
end
