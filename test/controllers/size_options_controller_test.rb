require 'test_helper'

class SizeOptionsControllerTest < ActionController::TestCase
  setup do
    @size_option = size_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:size_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create size_option" do
    assert_difference('SizeOption.count') do
      post :create, size_option: { item_id: @size_option.item_id, size: @size_option.size }
    end

    assert_redirected_to size_option_path(assigns(:size_option))
  end

  test "should show size_option" do
    get :show, id: @size_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @size_option
    assert_response :success
  end

  test "should update size_option" do
    patch :update, id: @size_option, size_option: { item_id: @size_option.item_id, size: @size_option.size }
    assert_redirected_to size_option_path(assigns(:size_option))
  end

  test "should destroy size_option" do
    assert_difference('SizeOption.count', -1) do
      delete :destroy, id: @size_option
    end

    assert_redirected_to size_options_path
  end
end
