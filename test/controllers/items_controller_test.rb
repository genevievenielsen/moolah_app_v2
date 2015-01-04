require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { category: @item.category, club_id: @item.club_id, color: @item.color, expiration_date: @item.expiration_date, image: @item.image, name: @item.name, owner_id: @item.owner_id, price: @item.price, required: @item.required, size: @item.size, university_id: @item.university_id }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { category: @item.category, club_id: @item.club_id, color: @item.color, expiration_date: @item.expiration_date, image: @item.image, name: @item.name, owner_id: @item.owner_id, price: @item.price, required: @item.required, size: @item.size, university_id: @item.university_id }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
