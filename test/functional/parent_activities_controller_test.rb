require 'test_helper'

class ParentActivitiesControllerTest < ActionController::TestCase
  setup do
    @parent_activity = parent_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parent_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent_activity" do
    assert_difference('ParentActivity.count') do
      post :create, parent_activity: {  }
    end

    assert_redirected_to parent_activity_path(assigns(:parent_activity))
  end

  test "should show parent_activity" do
    get :show, id: @parent_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent_activity
    assert_response :success
  end

  test "should update parent_activity" do
    put :update, id: @parent_activity, parent_activity: {  }
    assert_redirected_to parent_activity_path(assigns(:parent_activity))
  end

  test "should destroy parent_activity" do
    assert_difference('ParentActivity.count', -1) do
      delete :destroy, id: @parent_activity
    end

    assert_redirected_to parent_activities_path
  end
end
