require 'test_helper'

class CommentsharesControllerTest < ActionController::TestCase
  setup do
    @commentshare = commentshares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commentshares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commentshare" do
    assert_difference('Commentshare.count') do
      post :create, commentshare: { body: @commentshare.body, share_id: @commentshare.share_id, user_id: @commentshare.user_id }
    end

    assert_redirected_to commentshare_path(assigns(:commentshare))
  end

  test "should show commentshare" do
    get :show, id: @commentshare
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commentshare
    assert_response :success
  end

  test "should update commentshare" do
    patch :update, id: @commentshare, commentshare: { body: @commentshare.body, share_id: @commentshare.share_id, user_id: @commentshare.user_id }
    assert_redirected_to commentshare_path(assigns(:commentshare))
  end

  test "should destroy commentshare" do
    assert_difference('Commentshare.count', -1) do
      delete :destroy, id: @commentshare
    end

    assert_redirected_to commentshares_path
  end
end
