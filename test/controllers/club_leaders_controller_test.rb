require 'test_helper'

class ClubLeadersControllerTest < ActionController::TestCase
  setup do
    @club_leader = club_leaders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:club_leaders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create club_leader" do
    assert_difference('ClubLeader.count') do
      post :create, club_leader: { first_name: @club_leader.first_name, last_name: @club_leader.last_name, title: @club_leader.title }
    end

    assert_redirected_to club_leader_path(assigns(:club_leader))
  end

  test "should show club_leader" do
    get :show, id: @club_leader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @club_leader
    assert_response :success
  end

  test "should update club_leader" do
    patch :update, id: @club_leader, club_leader: { first_name: @club_leader.first_name, last_name: @club_leader.last_name, title: @club_leader.title }
    assert_redirected_to club_leader_path(assigns(:club_leader))
  end

  test "should destroy club_leader" do
    assert_difference('ClubLeader.count', -1) do
      delete :destroy, id: @club_leader
    end

    assert_redirected_to club_leaders_path
  end
end
