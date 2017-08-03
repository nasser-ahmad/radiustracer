class IpRangesController < ApplicationController

    before_action :prepare_action, only: [:edit, :update, :delete , :destroy]

	def index
		@isp = Isp.find(params[:isp_id])
		@ip_ranges = IpRange.where(:isp_id => @isp.id).paginate(:page => params[:page], per_page: 10)

	end

	def edit
	end

	def update
	end

	def delete
	end

	def destroy
	end
	
	def new
		@ip_range = IpRange.new
		@isp = Isp.find(params[:isp_id])		
	end

	def create
	  @ip_range = IpRange.new(ip_range_params)
	 
	  respond_to do |format|
	    if @ip_range.save
	      format.js  {redirect_to isps_path }
	    else

	    end
	  end		
	end

	private

	  def ip_range_params
	    params.require(:ip_range).permit(:ip_range,:note, :isp_id)
	  end

	  def prepare_action
		@isp = Isp.find(params[:isp_id])		
		@ip_range = IpRange.find(params[:id])
	  end
end