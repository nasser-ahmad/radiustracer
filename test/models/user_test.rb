require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new
  end

  test "name should be less than 50" do
  	@user.name = 'ah'*20
  	assert @user.invalid?
  	assert_not @user.errors[:name].any?
  end

  test "name should be present" do
  	@user.name = 'ahmad'
  	assert @user.invalid?
  	assert_not @user.errors[:name].any?
  end

  test "name should be unique" do
  	#user1 = User.create(name: 'ahmad', password: 'ahmad')
  	#user2 = User.new(name: 'ahmadd' , password: 'ahmadd')
  	#assert user2.save , 'saved two users with the same names'
  end


  test "email should be valid" do
  	@user.name = 'ahmad'
  	@user.password = 'ahmadahmad'
  	@user.password_confirmation = 'ahmadahmad'
  	@user.email = 'a@abbcc.f'
  	@user.valid?
  	assert_not @user.errors[:email].any?
  end

  test "email should be less than 250 character" do
  	@user.name = 'ahmad'
  	@user.password = 'ahmadahmad'
  	@user.password_confirmation = 'ahmadahmad'
  	@user.email = 'a@abbcc.f'
  	@user.valid?
  	assert_not @user.errors[:email].any?
  end

  test "password should be present" do
  	@user.name = 'ahmad'
  	@user.password = 'ahmadahmad'
  	@user.password_confirmation = 'ahmadahmad'
  	@user.email = 'aa@bb.cc'
  	assert @user.valid?
  	assert_not @user.errors[:password].any?
  end

  test "password should be more than 5 characters" do
  	@user.name = 'ahmad'
  	@user.password = 'ahmadd'
  	@user.password_confirmation = 'ahmadd'
  	@user.email = 'aa@bb.cc'
  	assert @user.valid?
  	assert_not @user.errors[:password].any?
  end
end
