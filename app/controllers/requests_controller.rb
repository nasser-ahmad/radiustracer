require 'ipaddr'
require 'date'
class RequestsController < ApplicationController

	before_action :logged_in_user

	def index
		@requests = Request.paginate(:page => params[:page], per_page: 10)
		@isps = Isp.all		
	end

	def show
		@request = Request.find(params[:id])
	end

	def new
		@isps = Isp.all
		@request = Request.new
	end


	def create
		@request = Request.new(request_params)
		isp = Isp.find(@request.isp_id)
		if @request.save
			ActionLog.create(username: current_user.name , action_type: 1 , finished: :true, notice: 'تمت إضافة العملية بنجاح !!!')			
			flash[:success] = "تمت إضافة العملية بنجاح !!!"
			redirect_to requests_path
		else
			ActionLog.create(username: current_user.name , action_type: 1 , finished: :false, notice: 'خطأ في إضافة عملية جديدة!!')
			flash[:danger] = "خطأ في إضافة عملية جديدة!!"
			@isps = Isp.all
			render 'new'
		end
	end

	def search
		if !params[:isp_id].nil? 
			@requests= Request.where(:isp_id => params[:isp_id])
			respond_to do |format|
				format.js
			end
		else
			d_time = DateTime.parse(params[:from_date])
			@requests = Request.created_between(d_time.beginning_of_day,d_time.end_of_day)

			respond_to do |format|
				format.js
			end
		end
		
	end

	private

		def request_params
			params.require(:request).permit(:isp_id,:private_ip,:router_ip,:assign_date, :release_date,:rad_assign_date, :rad_release_date,:has_error, :public_ip , :from_date)
		end

		def check_isp_range(ranges)
			ranges.any? { |ip_r| IPAddr.new(ip_r.ip_range + '/' + ip_r.subnet_mask).include?(IPAddr.new(request.remote_ip))}			
		end

end