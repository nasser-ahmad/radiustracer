class PagesController < ApplicationController

	def home
		@ip_search = IpSearch.new		
	end

end
