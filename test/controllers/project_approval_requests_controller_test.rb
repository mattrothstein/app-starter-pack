require 'test_helper'

class ProjectApprovalRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_approval_request = project_approval_requests(:one)
  end

  test "should get index" do
    get project_approval_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_project_approval_request_url
    assert_response :success
  end

  test "should create project_approval_request" do
    assert_difference('ProjectApprovalRequest.count') do
      post project_approval_requests_url, params: { project_approval_request: { name: @project_approval_request.name, notes: @project_approval_request.notes, status: @project_approval_request.status, user_id: @project_approval_request.user_id } }
    end

    assert_redirected_to project_approval_request_url(ProjectApprovalRequest.last)
  end

  test "should show project_approval_request" do
    get project_approval_request_url(@project_approval_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_approval_request_url(@project_approval_request)
    assert_response :success
  end

  test "should update project_approval_request" do
    patch project_approval_request_url(@project_approval_request), params: { project_approval_request: { name: @project_approval_request.name, notes: @project_approval_request.notes, status: @project_approval_request.status, user_id: @project_approval_request.user_id } }
    assert_redirected_to project_approval_request_url(@project_approval_request)
  end

  test "should destroy project_approval_request" do
    assert_difference('ProjectApprovalRequest.count', -1) do
      delete project_approval_request_url(@project_approval_request)
    end

    assert_redirected_to project_approval_requests_url
  end
end
