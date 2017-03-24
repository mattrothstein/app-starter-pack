class CreateInventoryItemUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_item_units do |t|
      t.references :inventory_item, foreign_key: true
      t.date :checked_out
      t.date :checked_in
      t.string :checked_out_by

      t.timestamps
    end
  end
end
