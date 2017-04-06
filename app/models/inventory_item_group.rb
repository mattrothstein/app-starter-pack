class InventoryItemGroup < ApplicationRecord
  belongs_to :inventory_location
  has_many :grouped_items
end
