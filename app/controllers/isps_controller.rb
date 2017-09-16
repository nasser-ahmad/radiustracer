class IspsController < ApplicationController

	before_action :logged_in_user
	def index
		@isps = Isp.search(params[:i_term]).paginate(:page => params[:page], per_page: 6)
	end

	def show
		@isp = Isp.find(params[:id])
	end

	def new
		@isp = Isp.new
	end

	def create
		@isp = Isp.new(isp_params)
		if @isp.save
			notice = 'تمت إضافة مزود جديد ' + @isp.name + ' بنجاح'
    		ActionLog.create(username: current_user.name , action_type: 1 , finished: :true, notice: notice)          
			flash[:success]= "تمت إضافة موزد جديد بنجاح"
			redirect_to isps_path
		else
			render 'new'
		end

	end

	def edit
		@isp = Isp.find(params[:id])
	end

	def update
		@isp = Isp.find(params[:id])

		if @isp.update(isp_params)
			notice = 'تحديث بيانات المزود' + @isp.name + ' بنجاح'
			ActionLog.create(username: current_user.name , action_type: 2 , finished: :true, notice: notice)
			flash[:success]= "تم تحديث بيانات المزود بنجاح!!!"
			redirect_to isp_path(@isp)
		else
			render 'edit'
		end
	end

	def destroy
		name = Isp.find(params[:id]).name
		Isp.find(params[:id]).destroy
		notice = 'تم حذف المزود ' + name + 'بنجاح'
		ActionLog.create(username: current_user.name , action_type: 3 , finished: :true, notice: notice)
		flash[:success] = "تم حذف المزود"
		redirect_to isps_path
	end

	private

		def isp_params

			params.require(:isp).permit(:name , :ranges , :i_term , :r_term)
		end
end