class InventoryItem < ApplicationRecord
  belongs_to :inventory_location
  has_many :inventory_item_units
  has_attached_file :barcode
  validates_attachment_content_type :barcode, content_type: /\Aimage\/.*\z/

  def checkout(amt, usr)
    if self.inventory_item_units.available.count >= amt
      self.inventory_item_units.available[0 .. (amt - 1)].each do |unit|
        unit.checkout_unit(usr)
      end
    else
      raise "Insufficient Inventory - Requested #{amt} #{self.name.titleize} only have #{self.inventory_item_units.available.count} in stock."
    end
  end

  def checkin(amt)
    amt.times do
      self.inventory_item_units.create(checked_in: Date.today)
    end
  end

end
