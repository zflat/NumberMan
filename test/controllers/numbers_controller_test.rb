require 'test_helper'

class NumbersControllerTest < ActionController::TestCase

  test "should get new when signed in" do
    sign_in :user, users(:valid_org_user)
    get :new
    assert_response :success
  end

  test "should get index when signed in" do
    sign_in :user, users(:valid_org_user)
    get :index
    assert_response :success
  end

end
