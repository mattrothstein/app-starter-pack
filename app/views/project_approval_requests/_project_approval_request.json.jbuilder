json.extract! project_approval_request, :id, :user_id, :name, :notes, :status, :created_at, :updated_at
json.url project_approval_request_url(project_approval_request, format: :json)
