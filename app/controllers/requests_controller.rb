require 'ipaddr'
class RequestsController < ApplicationController


	def index
		@requests = Request.paginate(:page => params[:page], per_page: 10)
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
		public_ip = request.remote_ip
		isp = Isp.find(@request.isp_id)
		if check_isp_range(isp.ip_ranges) 				
			@request.public_ip = public_ip
			if @request.save			
				flash[:notice] = "Request succecfully created !!!"
				redirect_to requests_path
			else
				flash[:notice] = "Error when trying to create new request!!"
				@isps = Isp.all
				render 'new'
			end
		else
			flash[:danger] = "العنوان الرقمي لا ينتمي للمزود المذكور"
			@isps = Isp.all
			render 'new'
		end
	end




	private

		def request_params
			params.require(:request).permit(:isp_id,:private_ip,:router_ip,:assign_date, :release_date,:public_ip)
		end

		def check_isp_range(ranges)
			ranges.any? { |ip_r| IPAddr.new(ip_r.ip_range + '/' + ip_r.subnet_mask).include?(IPAddr.new(request.remote_ip))}			
		end

end