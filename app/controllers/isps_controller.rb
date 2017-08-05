class IspsController < ApplicationController


	def index
		@isps = Isp.paginate(:page => params[:page], per_page: 10)
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
			flash[:notice]= "ISP added successfully!!!"
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
			flash[:notice]= "ISP updated successfully!!!"
			redirect_to isp_path(@isp)
		else
			render 'edit'
		end
	end

	def destroy
		Isp.find(params[:id]).destroy
		flash[:success] = "Isp deleted"
		redirect_to isps_path
	end

	private

		def isp_params

			params.require(:isp).permit(:name , :ranges)
		end
end