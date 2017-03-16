json.extract! time_off_request, :id, :user_id, :start_date, :end_date, :status, :created_at, :updated_at
json.url time_off_request_url(time_off_request, format: :json)
