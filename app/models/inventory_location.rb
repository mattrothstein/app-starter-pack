class InventoryLocation < ApplicationRecord
  has_many :inventory_items
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 20
end
