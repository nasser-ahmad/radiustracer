class IpRange < ActiveRecord::Base

	belongs_to :isp

	self.table_name = "ip_ranges"

end