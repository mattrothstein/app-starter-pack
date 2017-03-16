require 'test_helper'

class PurchaseOrderRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order_request = purchase_order_requests(:one)
  end

  test "should get index" do
    get purchase_order_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_request_url
    assert_response :success
  end

  test "should create purchase_order_request" do
    assert_difference('PurchaseOrderRequest.count') do
      post purchase_order_requests_url, params: { purchase_order_request: { name: @purchase_order_request.name, notes: @purchase_order_request.notes, price: @purchase_order_request.price, status: @purchase_order_request.status, user_id: @purchase_order_request.user_id } }
    end

    assert_redirected_to purchase_order_request_url(PurchaseOrderRequest.last)
  end

  test "should show purchase_order_request" do
    get purchase_order_request_url(@purchase_order_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_request_url(@purchase_order_request)
    assert_response :success
  end

  test "should update purchase_order_request" do
    patch purchase_order_request_url(@purchase_order_request), params: { purchase_order_request: { name: @purchase_order_request.name, notes: @purchase_order_request.notes, price: @purchase_order_request.price, status: @purchase_order_request.status, user_id: @purchase_order_request.user_id } }
    assert_redirected_to purchase_order_request_url(@purchase_order_request)
  end

  test "should destroy purchase_order_request" do
    assert_difference('PurchaseOrderRequest.count', -1) do
      delete purchase_order_request_url(@purchase_order_request)
    end

    assert_redirected_to purchase_order_requests_url
  end
end
