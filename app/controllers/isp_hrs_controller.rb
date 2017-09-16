class IspHrsController < ApplicationController

	before_action :logged_in_user
	before_action :find_isp 
	
	def index
		@isp_hrs = IspHr.where(:isp_id => @isp.id)
	end
	def new
		@isp_hr = IspHr.new
	end

	def create
		@isp_hr = IspHr.new(hr_params)

		if @isp_hr.save
			notice = 'تمت إضافة معلومات موظف جديد ' + @isp_hr.name + ' للمزود ' + @isp_hr.isp.name + ' بنجاح'
			ActionLog.create(username: current_user.name , action_type: 1 , finished: :true, notice: notice)
			flash[:success] = "تمت إضافة معلومات موظف جديد بنجاح"
			redirect_to isp_path(@isp)
		else
			render 'new'
		end
	end

	def edit
		@isp_hr = IspHr.find(params[:id])
	end

	def update
		@isp_hr = IspHr.find(params[:id])
		if @isp_hr.update(hr_params)
			notice = 'تم تحديث بيانات الموظف ' + @isp_hr.name + ' بنجاح على المزود ' + @isp_hr.isp.name
			ActionLog.create(username: current_user.name , action_type: 2 , finished: :true, notice: notice)
			flash[:success] = 'تم تعديل بيانات الموظف بنجاح'
			redirect_to isp_path(@isp)
		else
			render 'edit'
		end
	end

	def delete
		@isp_hr = IspHr.find(params[:id])
	end

	def destroy
		name = IspHr.find(params[:id]).name
		isp = IspHr.find(params[:id]).isp.name
		if IspHr.find(params[:id]).destroy
			notice = 'تم حذف بيانات الموظف ' + name + 'من المزود' + isp + ' بنجاح'
			ActionLog.create(username: current_user.name , action_type: 3 , finished: :true, notice: notice)
			flash[:success] = 'تم حذف بيانات الموظف بنجاح'
			redirect_to isp_path(@isp)
		end
	end

	private

		def hr_params
			params.require(:isp_hr).permit(:isp_id,:name,:job,:mob_n,:mob_n2,:home_n,:home_n2,:work_n,:work_n2, :address)
		end

		def find_isp
			@isp = Isp.find(params[:isp_id])
		end
end