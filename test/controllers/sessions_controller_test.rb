require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
<<<<<<< HEAD
    get login_url
=======
    get login_path
>>>>>>> Adding_validations
    assert_response :success
  end

end
