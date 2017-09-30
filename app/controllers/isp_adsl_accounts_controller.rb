class IspAdslAccountsController < ApplicationController
	before_action :logged_in_user
	before_action :find_isp 
	
	def index
		@isp_adsl_accounts = IspAdslAccount.where(:isp_id => @isp.id)
	end
	def new
		@isp_adsl_account = IspAdslAccount.new
	end

	def create
		@isp_adsl_account = IspAdslAccount.new(isp_adsl_account_params)
		if @isp_adsl_account.save
			notice = 'تمت إضافة معلومات الحساب  '+ @isp_adsl_account.account + ' للمزود' + @isp_adsl_account.isp.name + ' بنجاح '
      		ActionLog.create(username: current_user.name , action_type: 1 , finished: :true, notice: notice)          
			flash[:success] = "تمت إضافة الحساب بنجاح"
			redirect_to isp_path(@isp)
		else
			render 'new'
		end
	end

	def edit
		@isp_adsl_account = IspAdslAccount.find(params[:id])
	end

	def update
		@isp_adsl_account = IspAdslAccount.find(params[:id])
		if @isp_adsl_account.update(isp_adsl_account_params)
			notice = 'تمت تحديث معلومات الحساب '+ @isp_adsl_account.account + ' للمزود' + @isp_adsl_account.isp.name + ' بنجاح '
      		ActionLog.create(username: current_user.name , action_type: 2 , finished: :true, notice: notice)          
			flash[:success] = 'تمت تحديث الحساب بنجاح'
			redirect_to isp_path(@isp)
		else
			render 'edit'
		end
	end

	def delete
		@isp_adsl_account = IspAdslAccount.find(params[:id])
	end

	def destroy
		account = IspAdslAccount.find(params[:id]).account
		if IspAdslAccount.find(params[:id]).destroy
			notice = 'تم حذف الحساب ' +  account + ' بنجاح'
      		ActionLog.create(username: current_user.name , action_type: 3 , finished: :true, notice: notice)          
			flash[:success] = 'تم حذف الحساب بنجاح'
			redirect_to isp_path(@isp)
		end
	end

	private

		def isp_adsl_account_params
			params.require(:isp_adsl_account).permit(:isp_id,:account, :adsl_password)
		end

		def find_isp
			@isp = Isp.find(params[:isp_id])
		end	
end