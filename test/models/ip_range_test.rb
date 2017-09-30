require 'test_helper'
class IpRangeTest < ActiveSupport::TestCase

	test "should has ip_range" do 
		ip_range = IpRange.new
		ip_range.ip_range = '10.0.0.1'
		assert ip_range.invalid?
		assert_not ip_range.errors[:ip_range].any?
	end

	test "should has ip_subnet_mask" do
		ip_range = IpRange.new
		ip_range.subnet_mask = '255.0.0.0'
		assert ip_range.invalid?
		assert_not ip_range.errors[:subnet_mask].any?		
	end

	test "ip_range should be valid" do

	end


end