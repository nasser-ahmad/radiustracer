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


    def self.ip_range_search(r_term)
		if r_term
			where('ip_range = ?', "#{r_term}")
		else
			nil
		end
	end
end