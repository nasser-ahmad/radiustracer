require "resolv"
class Request < ActiveRecord::Base
	belongs_to :isp
	
	validates :private_ip, :format => { 
                  :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
                }
    validates :router_ip, :format => { 
      :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
    			}

	scope :created_between, lambda {|start_date, end_date| where("updated_at >= ? AND created_at <= ?", start_date, end_date )}
end