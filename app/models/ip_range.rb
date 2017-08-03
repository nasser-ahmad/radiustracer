require 'resolv'
class IpRange < ActiveRecord::Base

	belongs_to :isp

	self.table_name = "ip_ranges"

	validates :ip_range, :format => { 
                  :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
                }

end