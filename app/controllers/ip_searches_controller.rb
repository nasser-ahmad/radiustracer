class IpSearchesController < ApplicationController
	


	def create
		@ip_searchh = IpSearch.new(ip_search_p)
		
		respond_to do |format|
			if @ip_searchh.valid?
				@ip_ranges = IpSearch.ip_range_search(@ip_searchh.ip_term)
				format.js
			else
				format.js
			end
		end
	end

	private

		def ip_search_p
			params.require(:ip_search).permit(:ip_term)
		end

end