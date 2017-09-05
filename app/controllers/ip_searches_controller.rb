class IpSearchesController < ApplicationController
	


	def create
		@ip_searchh = IpSearch.new(ip_search_p)
		
		if @ip_searchh.valid?
			@ip_ranges = IpSearch.ip_range_search(@ip_searchh.ip_term)
			respond_to do |format|
				format.js
			end
		else
			redirect_to root_path
		end
	end

	private

		def ip_search_p
			params.require(:ip_search).permit(:ip_term)
		end

end