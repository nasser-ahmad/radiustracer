class IpRangesController < ApplicationController

	
	def new

	end

	def create
	  @ip_range = IpRange.new(ip_range_params)
	 
	  respond_to do |format|
	    if @ip_range.save
	      format.js  {render layout: false}
	    else

	    end
	  end		
	end

	private

	  def ip_range_params
	    params.require(:ip_range).permit(:ip_range,:note, :isp_id)
	  end
end