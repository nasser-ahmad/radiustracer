require 'test_helper'

class IspTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save isp without name" do
  	isp1 = Isp.new
  	assert_not isp1.save
  end

  test "should report error" do
  	assert_raise(NameError) do
  		some_undefined_variable
  	end
  end

  test "isp attributes must not be empty" do
  	isp1 =  Isp.new
  	assert isp1.invalid?
  	assert isp1.errors[:name].any?
  	assert_not isp1.errors[:note].any?
  end

  test "isp name must be unique" do
  	isp1 = Isp.create(name: "first")
  	isp2 = Isp.new(name: "First")
  	assert_not isp2.save , "saved isp with the same name"
  end


end
