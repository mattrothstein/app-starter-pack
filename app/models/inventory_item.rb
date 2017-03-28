class InventoryItem < ApplicationRecord
  belongs_to :inventory_location
  has_many :inventory_item_units
  has_attached_file :barcode
  validates_attachment_content_type :barcode, content_type: /\Aimage\/.*\z/

end
