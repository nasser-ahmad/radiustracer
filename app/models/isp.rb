require 'ipaddr'
class Isp < ActiveRecord::Base
	has_many :requests
	has_many :ranges








	def is_ip? ip
		if ipv4? ip
			return true
		else
			return false
		end
	end

end