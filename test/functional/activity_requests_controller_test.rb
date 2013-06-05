require 'test_helper'

class ActivityRequestsControllerTest < ActionController::TestCase
  setup do
    @activity_request = activity_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_request" do
    assert_difference('ActivityRequest.count') do
      post :create, activity_request: {  }
    end

    assert_redirected_to activity_request_path(assigns(:activity_request))
  end

  test "should show activity_request" do
    get :show, id: @activity_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_request
    assert_response :success
  end

  test "should update activity_request" do
    put :update, id: @activity_request, activity_request: {  }
    assert_redirected_to activity_request_path(assigns(:activity_request))
  end

  test "should destroy activity_request" do
    assert_difference('ActivityRequest.count', -1) do
      delete :destroy, id: @activity_request
    end

    assert_redirected_to activity_requests_path
  end
end
