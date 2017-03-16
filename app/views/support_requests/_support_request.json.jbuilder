json.extract! support_request, :id, :status, :issue, :priority, :user_id, :created_at, :updated_at
json.url support_request_url(support_request, format: :json)
