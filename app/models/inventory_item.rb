class InventoryItem < ApplicationRecord
  belongs_to :inventory_location
  has_many :inventory_item_units
end
