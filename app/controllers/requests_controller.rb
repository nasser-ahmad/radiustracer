class RequestsController < ApplicationController


	def index
		@requests = Request.all
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
		if @request.save			
			flash[:notice] = "Request succecfully created !!!"
			redirect_to requests_path
		else
			flash[:notice] = "Error when trying to create new request!!"
			render 'new'
		end
	end




	private

		def request_params
			params.require(:request).permit(:isp_id,:private_ip,:router_ip,:assign_date, :release_date,:public_ip)
		end

end