json.extract! purchase_order_request, :id, :user_id, :name, :notes, :price, :status, :created_at, :updated_at
json.url purchase_order_request_url(purchase_order_request, format: :json)
