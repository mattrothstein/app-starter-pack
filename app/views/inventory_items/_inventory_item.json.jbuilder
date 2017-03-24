json.extract! inventory_item, :id, :inventory_location_id, :name, :price, :unit_of_measurement, :created_at, :updated_at
json.url inventory_item_url(inventory_item, format: :json)
