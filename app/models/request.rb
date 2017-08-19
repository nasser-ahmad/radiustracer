require "resolv"
class Request < ActiveRecord::Base
	belongs_to :isp
	
	validates :private_ip, :format => { 
                  :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
                }
    validates :router_ip, :format => { 
      :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
    			}



end