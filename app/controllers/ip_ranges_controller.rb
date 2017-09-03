class IpRangesController < ApplicationController
	before_action :logged_in_user 
    before_action  :prepare_action, only: [:show, :edit, :update, :delete , :destroy]

	def index
		@isp = Isp.find(params[:isp_id])
		@ip_ranges = IpRange.where(:isp_id => @isp.id).paginate(:page => params[:page], per_page: 10)

	end

	def search
		@ip_ranges = IpRange.ip_range_search(params[:r_term])
		respond_to do |format|
			if !@ip_ranges.nil?
				format.js
			else
				
			end
		end
	end

	def show

	end	
	
	def new
		@isp = Isp.find(params[:isp_id])		
		@ip_range = IpRange.new
	end

	def create
	  @ip_range = IpRange.new(ip_range_params)
	  @isp = Isp.find(params[:isp_id])			  		 
      if @ip_range.save
        flash[:success] = 'Range added successfulyy'
        redirect_to isp_path(@isp)
	  else
	  	render 'new'
      end
	end




	def edit
	end

	def update
	end

	def delete
	end

	def destroy
	end







	private

	  def ip_range_params
	    params.require(:ip_range).permit(:ip_range,:subnet_mask, :note, :isp_id , :r_term)
	  end

	  def prepare_action
		@ip_range = IpRange.find(params[:id])
		@isp = @ip_range.isp_id
	  end
end