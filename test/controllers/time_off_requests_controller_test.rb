require 'test_helper'

class TimeOffRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_off_request = time_off_requests(:one)
  end

  test "should get index" do
    get time_off_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_time_off_request_url
    assert_response :success
  end

  test "should create time_off_request" do
    assert_difference('TimeOffRequest.count') do
      post time_off_requests_url, params: { time_off_request: { end_date: @time_off_request.end_date, start_date: @time_off_request.start_date, status: @time_off_request.status, user_id: @time_off_request.user_id } }
    end

    assert_redirected_to time_off_request_url(TimeOffRequest.last)
  end

  test "should show time_off_request" do
    get time_off_request_url(@time_off_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_off_request_url(@time_off_request)
    assert_response :success
  end

  test "should update time_off_request" do
    patch time_off_request_url(@time_off_request), params: { time_off_request: { end_date: @time_off_request.end_date, start_date: @time_off_request.start_date, status: @time_off_request.status, user_id: @time_off_request.user_id } }
    assert_redirected_to time_off_request_url(@time_off_request)
  end

  test "should destroy time_off_request" do
    assert_difference('TimeOffRequest.count', -1) do
      delete time_off_request_url(@time_off_request)
    end

    assert_redirected_to time_off_requests_url
  end
end
