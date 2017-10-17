class PagesController < ApplicationController
	def home
		@ip_search = IpSearch.new
		@ip_ranges = IpSearch.ip_range_search(request.remote_ip)		
	end	
end
