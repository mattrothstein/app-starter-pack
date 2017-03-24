class InventoryLocation < ApplicationRecord
  has_many :inventory_items
end
