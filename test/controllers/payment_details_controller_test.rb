require 'test_helper'

class PaymentDetailsControllerTest < ActionController::TestCase
  setup do
    @payment_detail = payment_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_detail" do
    assert_difference('PaymentDetail.count') do
      post :create, payment_detail: { amount: @payment_detail.amount, bank: @payment_detail.bank, branch: @payment_detail.branch, dd_number: @payment_detail.dd_number }
    end

    assert_redirected_to payment_detail_path(assigns(:payment_detail))
  end

  test "should show payment_detail" do
    get :show, id: @payment_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_detail
    assert_response :success
  end

  test "should update payment_detail" do
    patch :update, id: @payment_detail, payment_detail: { amount: @payment_detail.amount, bank: @payment_detail.bank, branch: @payment_detail.branch, dd_number: @payment_detail.dd_number }
    assert_redirected_to payment_detail_path(assigns(:payment_detail))
  end

  test "should destroy payment_detail" do
    assert_difference('PaymentDetail.count', -1) do
      delete :destroy, id: @payment_detail
    end

    assert_redirected_to payment_details_path
  end
end
