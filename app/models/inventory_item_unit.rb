class InventoryItemUnit < ApplicationRecord
  belongs_to :inventory_item
  after_create :checkin

  def checkout_unit(usr)
    self.checked_out = Date.today
    self.checked_out_by = usr
    self.save
  end

  def self.available()
    where(checked_out: nil)
  end

  def checkin
    self.checked_in = Date.today
    self.save
  end
end
