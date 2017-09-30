require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
<<<<<<< HEAD
    get new_user_url
=======
    get users_path
>>>>>>> Adding_validations
    assert_response :success
  end

end
