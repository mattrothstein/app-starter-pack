class AddAttachmentBarcodeToInventoryItems < ActiveRecord::Migration
  def self.up
    change_table :inventory_items do |t|
      t.attachment :barcode
    end
  end

  def self.down
    remove_attachment :inventory_items, :barcode
  end
end
