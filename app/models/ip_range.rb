require 'resolv'
class IpRange < ActiveRecord::Base
	
	
	belongs_to :isp
	has_many :ip_range_notes



	self.table_name = "ip_ranges"

	validates :ip_range, :format => { 
                  :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
                }
    validates :subnet_mask, :format => { 
			      :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
			    }
	

    validates :ip_range , presence: true
    validates :subnet_mask , presence: true



	def self.ip_range_search(ip_term)
		ip_ranges = []
		ip_b = IPAddr.new(ip_term) 
		IpRange.all.each { |ip_r| 
			ip_a = IPAddr.new(ip_r.ip_range)
			ip_a.mask(ip_r.subnet_mask)
			ip_ranges << ip_r if ip_a.include?(ip_b)
		}
		return ip_ranges
	end
end