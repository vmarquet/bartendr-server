require 'test_helper'

class QrcodeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    sign_in User.find(1)
    get :index
    assert_response :success
  end
end
