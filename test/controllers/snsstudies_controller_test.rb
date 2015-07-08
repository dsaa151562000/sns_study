require 'test_helper'

class SnsstudiesControllerTest < ActionController::TestCase
  setup do
    @snsstudy = snsstudies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snsstudies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snsstudy" do
    assert_difference('Snsstudy.count') do
      post :create, snsstudy: { introduction: @snsstudy.introduction, name: @snsstudy.name }
    end

    assert_redirected_to snsstudy_path(assigns(:snsstudy))
  end

  test "should show snsstudy" do
    get :show, id: @snsstudy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @snsstudy
    assert_response :success
  end

  test "should update snsstudy" do
    patch :update, id: @snsstudy, snsstudy: { introduction: @snsstudy.introduction, name: @snsstudy.name }
    assert_redirected_to snsstudy_path(assigns(:snsstudy))
  end

  test "should destroy snsstudy" do
    assert_difference('Snsstudy.count', -1) do
      delete :destroy, id: @snsstudy
    end

    assert_redirected_to snsstudies_path
  end
end
