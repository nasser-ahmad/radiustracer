require 'resolv'
class Isp < ActiveRecord::Base
	has_many :requests
	has_many :ip_ranges
	has_many :isp_hrs
	has_many :notes






	def is_ip? ip
		if ipv4? ip
			return true
		else
			return false
		end
	end

end