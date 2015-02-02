require 'test_helper'

class ColorOptionsControllerTest < ActionController::TestCase
  setup do
    @color_option = color_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:color_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create color_option" do
    assert_difference('ColorOption.count') do
      post :create, color_option: { color: @color_option.color, item_id: @color_option.item_id }
    end

    assert_redirected_to color_option_path(assigns(:color_option))
  end

  test "should show color_option" do
    get :show, id: @color_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @color_option
    assert_response :success
  end

  test "should update color_option" do
    patch :update, id: @color_option, color_option: { color: @color_option.color, item_id: @color_option.item_id }
    assert_redirected_to color_option_path(assigns(:color_option))
  end

  test "should destroy color_option" do
    assert_difference('ColorOption.count', -1) do
      delete :destroy, id: @color_option
    end

    assert_redirected_to color_options_path
  end
end
