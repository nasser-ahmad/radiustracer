require 'resolv'
class IpSearch

  include ActiveModel::Model

  attr_accessor :ip_term

  validates :ip_term, :format => { 
                  :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
                }
  def self.ip_range_search(ip_t)
	ip_ranges = []
	ip_b = IPAddr.new(ip_t)
	IpRange.all.each { |ip_r| 
		ip_a = IPAddr.new(ip_r.ip_range)
		ip_a = ip_a.mask(ip_r.subnet_mask)
		ip_ranges << ip_r if ip_a.include?(ip_b)
	}
	return ip_ranges
  end
end