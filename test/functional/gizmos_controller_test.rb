require 'test_helper'

class GizmosControllerTest < ActionController::TestCase
  setup do
    @gizmo = gizmos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gizmos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gizmo" do
    assert_difference('Gizmo.count') do
      post :create, gizmo: @gizmo.attributes
    end

    assert_redirected_to gizmo_path(assigns(:gizmo))
  end

  test "should show gizmo" do
    get :show, id: @gizmo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gizmo
    assert_response :success
  end

  test "should update gizmo" do
    put :update, id: @gizmo, gizmo: @gizmo.attributes
    assert_redirected_to gizmo_path(assigns(:gizmo))
  end

  test "should destroy gizmo" do
    assert_difference('Gizmo.count', -1) do
      delete :destroy, id: @gizmo
    end

    assert_redirected_to gizmos_path
  end
end
