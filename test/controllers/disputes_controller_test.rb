require 'test_helper'

class DisputesControllerTest < ActionController::TestCase
  setup do
    @dispute = disputes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disputes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dispute" do
    assert_difference('Dispute.count') do
      post :create, dispute: { company: @dispute.company, policy_link: @dispute.policy_link, policy_name: @dispute.policy_name, policy_text: @dispute.policy_text }
    end

    assert_redirected_to dispute_path(assigns(:dispute))
  end

  test "should show dispute" do
    get :show, id: @dispute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dispute
    assert_response :success
  end

  test "should update dispute" do
    patch :update, id: @dispute, dispute: { company: @dispute.company, policy_link: @dispute.policy_link, policy_name: @dispute.policy_name, policy_text: @dispute.policy_text }
    assert_redirected_to dispute_path(assigns(:dispute))
  end

  test "should destroy dispute" do
    assert_difference('Dispute.count', -1) do
      delete :destroy, id: @dispute
    end

    assert_redirected_to disputes_path
  end
end
