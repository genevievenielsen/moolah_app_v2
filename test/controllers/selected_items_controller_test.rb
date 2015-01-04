require 'test_helper'

class SelectedItemsControllerTest < ActionController::TestCase
  setup do
    @selected_item = selected_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selected_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selected_item" do
    assert_difference('SelectedItem.count') do
      post :create, selected_item: { cart_id: @selected_item.cart_id, item_id: @selected_item.item_id, user_id: @selected_item.user_id }
    end

    assert_redirected_to selected_item_path(assigns(:selected_item))
  end

  test "should show selected_item" do
    get :show, id: @selected_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selected_item
    assert_response :success
  end

  test "should update selected_item" do
    patch :update, id: @selected_item, selected_item: { cart_id: @selected_item.cart_id, item_id: @selected_item.item_id, user_id: @selected_item.user_id }
    assert_redirected_to selected_item_path(assigns(:selected_item))
  end

  test "should destroy selected_item" do
    assert_difference('SelectedItem.count', -1) do
      delete :destroy, id: @selected_item
    end

    assert_redirected_to selected_items_path
  end
end
