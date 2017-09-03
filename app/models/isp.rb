require 'resolv'
class Isp < ActiveRecord::Base
	has_many :requests
	has_many :ip_ranges
	has_many :isp_hrs
	has_many :notes




	def self.search(term)
		if term
			where('name LIKE ?', "%#{term}%")
		else
			all
		end
	end

	def is_ip? ip
		if ipv4? ip
			return true
		else
			return false
		end
	end

end